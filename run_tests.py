"""
Experiment runner for dash evaluation.
Heavily inspired by gg's results eval:
    https://github.com/StanfordSNR/gg-results/blob/master/run-test
"""
import os
import sys
import run_dash
import subprocess as sh
import time
from contextlib import contextmanager
DEFAULT_ENV = os.environ.copy() # this should contain config.sh
ROOT_DIR = os.path.abspath(os.path.dirname(__file__))
RESULTS_DIR = os.path.join(ROOT_DIR, 'results')
def debug(*args):
    print('\u2192', *args, file=sys.stderr)

@contextmanager
def pushd(new_dir):
    prev_dir = os.getcwd()
    debug('chdir to', new_dir)
    os.chdir(new_dir)
    yield
    debug('chdir back to', prev_dir)
    os.chdir(prev_dir)

def usage(argv0):
    print("{} <folder_name> <app-name> <test-name> [repeat-count=10] [config.sh]".format(argv0))


def prepare_folders(folder_name, program_name, test_name):
    path = os.path.join(folder_name, program_name, test_name)
    
    if os.path.exists(path):
    #    raise Exception("Experiment folder already exists, remove manually.")
        debug("Path {} exists, overwriting previous results.".format(path))
    else:
        os.makedirs(path, exist_ok = False)
    return path

def run_tests(folder_name, test_name, app_name, run_index):
    result_path = prepare_folders(folder_name, app_name, test_name)
    program_path = os.path.join(ROOT_DIR, 'apps', app_name, test_name)
    if "git" in app_name:
        run_git_test(test_name, app_name, str(run_index))
        return
    prep_cmds = ['./prep.sh']
    if os.path.exists(os.path.join(program_path, "prep-2.sh")):
        prep_cmds.append("./prep-2.sh")
    run_cmd = './run.sh'
    run_separate_cmd = './run-separate.sh'
    cleanup_cmd = './cleanup.sh'

    if not os.path.exists(program_path):
        debug(program_path)
        raise Exception("program not found")
    
    unmount_cmd = ["./unmount.sh"]
    mount_cmd = ["./mount.sh"]
    if os.path.ismount(os.environ["CLIENT_MOUNT"]):
        sh.run(unmount_cmd)
    sh.check_call(mount_cmd)
    with pushd(program_path):
        env = DEFAULT_ENV.copy()
        env['TIMECOMMAND'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(result_path, '{}.log'.format(run_index)))
        env['TIMECOMMAND_1'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(result_path, '{}-cmd1.log'.format(run_index)))
        env['TIMECOMMAND_2'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(result_path, '{}-cmd2.log'.format(run_index)))
        env['TIMECOMMAND_3'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(result_path, '{}-cmd3.log'.format(run_index)))
        env['TIMECOMMAND_4'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(result_path, '{}-cmd4.log'.format(run_index)))
        if "dash" in test_name:
            run_dash_test([run_cmd], prep_cmds, env, app_name, run_index, result_path, cleanup_cmd)
            # todo: also run run_separate_cmd
        else:
            run_baseline_test([run_cmd], prep_cmds, env, app_name, run_index, result_path, cleanup_cmd)
            # todo: also run the run separate command

"""
Specifically for git, the setup for the tests is a little different, so have a separate function for this
"""
def run_git_test(folder_name, test_name, app_name, run_index):
    debug("Running special test for git")
    result_path = prepare_folders(folder_name, app_name, test_name)
    program_path = os.path.join(ROOT_DIR, 'apps', app_name, test_name)
    prep_cmds = ['./prep.sh']
    run_cmds = ['./run.sh', result_path, run_index]
    cleanup_cmd = './cleanup.sh'

    if not os.path.exists(program_path):
        debug(program_path)
        raise Exception("program not found")
    
    # mount and unmount
    unmount_cmd = ["./unmount.sh"]
    mount_cmd = ["./mount.sh"]
    if os.path.ismount(os.environ["CLIENT_MOUNT"]):
        sh.run(unmount_cmd)
    sh.check_call(mount_cmd)
    with pushd(program_path):
        debug(program_path)
        env = DEFAULT_ENV.copy()
        if "dash" in test_name:
            run_dash_test(run_cmds, prep_cmds, env, app_name, run_index, result_path, cleanup_cmd)
        else:
            run_baseline_test(run_cmds, prep_cmds, env, app_name, run_index, result_path, cleanup_cmd)
    print(run_cmds)

def run_dash_test(cmds, prep_cmds, env, app_name, run_index, result_path, cleanup_cmd):
        ## run the PREP on the client
        for prep_cmd in prep_cmds:
            sh.check_call([prep_cmd], env = env) 
        ## actually start running dash
        log_folder = "{path}/{appname}".format(path = env['SERVER_LOGS'], appname = app_name)
        log_name = "{trial}.log".format(trial = run_index)
        server_proc = run_dash.start_dash_server(log_folder, log_name)
        server_proc.start()
        debug("Started server")
        time.sleep(5)
        # TMP: check if dash is actually running

        ## try to actually run the command
        try:
            sh.check_call(cmds, env = env)
            debug('finished test')
        except:
            debug('test failed')
            try:
                os.rename(os.path.join(result_path, '{}.log'.format(run_index)), os.path.join(result_path, '{}.log.failed'.format(run_index)))
            except:
                pass
        
        ## kill the dash server
        done = run_dash.kill_dash_server()


        ## run the cleanup. important so the devices don't run out of space.
        sh.check_call([cleanup_cmd], env=env)


def run_baseline_test(cmd, prep_cmds, env, app_name, run_index, result_path, cleanup_cmd):
    ## run PREP on the client
    for prep_cmd in prep_cmds:
        sh.check_call([prep_cmd], env=env)

    ## run the command
    try:
        sh.check_call(cmd, env = env)
    except:
        debug('test failed')
        try:
            os.rename(os.path.join(result_path, '{}.log'.format(run_index)), os.path.join(result_path, '{}.log.failed'.format(run_index)))
        except:
            pass
    ## run the cleanup. important so devices don't run out of space.
    sh.check_call([cleanup_cmd], env=env)
     
def main():
    app_name = sys.argv[2]
    test_name = sys.argv[3]
    trial_number = int(sys.argv[4]) if len(sys.argv) > 4 else 0
    run_tests(folder_name, app_name, test_name, trial_number)

if __name__ == '__main__':
    if len(sys.argv) == 0:
        os.abort()
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        usage(sys.argv[0])
        sys.exit(1)
    
    # move to the experiment directory.
    os.chdir(ROOT_DIR)
    main()
