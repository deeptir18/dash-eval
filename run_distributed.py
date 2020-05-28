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
from run_tests import debug, prepare_folders, usage, pushd

DEFAULT_ENV = os.environ.copy()
ROOT_DIR = os.path.abspath(os.path.dirname(__file__))
## this is the set of servers for pancham
SERVERS = ["34.82.47.137", "34.105.7.124", "34.82.89.19", "35.227.152.201", "34.105.97.99"]
SERVER_MNT_PARENTS = ["/mnt/disks/ssd", "/mnt/disks/ssd1", "/mnt/disks/ssd", "/mnt/disks/ssd", "/mnt/disks/ssd"]
## this is the set of the servers for the cloud -> cloud tests
def run_tests(folder_name, app_name, test_name, run_index):
    result_path = prepare_folders(folder_name, test_name, app_name)
    program_path = os.path.join(ROOT_DIR, 'apps', test_name, app_name)

    ## run the possible unmount and mount for each server
    for i in range(len(SERVERS)):
        server = SERVERS[i]
        server_mount = "{}/{}".format(SERVER_MNT_PARENTS[i], os.environ["SERVER_FOLDER"])
        debug("Server folder: {}".format(server_mount))
        ## need to mount and unmount all the folders 
        env = DEFAULT_ENV.copy() # don't store server locations here
        ## need to run the prep for this server
        if os.path.ismount("{}{}".format(os.environ["CLIENT_MNT_BASE"], i)):
            sh.run(["./unmount-args.sh", "{}{}".format(os.environ["CLIENT_MNT_BASE"], i)])
        sh.check_call(["./mount-args.sh", server, server_mount, "{}{}".format(os.environ["CLIENT_MNT_BASE"], i)])
        debug("Mounted {}, mount # {}".format(server, i))
    

    with pushd(program_path):
        debug("Entering {}".format(program_path))
        env = DEFAULT_ENV.copy()

        ## need to run the prep, with each server
        debug("About to run prep for {}".format(app_name))
        for i in range(len(SERVERS)):
            server = SERVERS[i]
            server_mount = "{}/{}".format(SERVER_MNT_PARENTS[i], os.environ["SERVER_FOLDER"])
            prep_cmd = ["./prep.sh", server, server_mount]
            sh.check_call(prep_cmd, env=env)

        ## now run the actual tests
        if "dash" in app_name:
            success = run_dash_test(env, test_name, run_index, result_path)
        else:
            success = run_baseline_test(env, test_name, run_index, result_path)

        if success:
            for i in range(len(SERVERS)):
                server = SERVERS[i]
                server_mount = "{}/{}".format(SERVER_MNT_PARENTS[i], os.environ["SERVER_FOLDER"])
                cleanup_cmd = ["./cleanup.sh", server, server_mount]
                sh.check_call(cleanup_cmd, env=env)
            
    for i in range(len(SERVERS)):
        server = SERVERS[i]
        server_mount = "{}/{}".format(SERVER_MNT_PARENTS[i], os.environ["SERVER_FOLDER"])
        debug("Server folder: {}".format(server_mount))
        ## need to mount and unmount all the folders 
        env = DEFAULT_ENV.copy() # don't store server locations here
        ## need to run the prep for this server
        if os.path.ismount("{}{}".format(os.environ["CLIENT_MNT_BASE"], i)):
            sh.run(["./unmount-args.sh", "{}{}".format(os.environ["CLIENT_MNT_BASE"], i)])
        debug("Unmounted {}, mount # {}".format(server, i))
def run_dash_test(env, test_name, run_index, result_path):
    ## start 5 dash servers on different machines
    success = False
    for i in range(len(SERVERS)):
        debug("Starting server {}".format(i))
        server = SERVERS[i]
        server_mount = "{}/{}".format(SERVER_MNT_PARENTS[i], os.environ["SERVER_FOLDER"])
        log_folder = "{server_mnt}/{path}/{appname}".format(server_mnt = SERVER_MNT_PARENTS[i], path = env['SERVER_LOGS'], appname = test_name)
        log_name = "{trial}.log".format(trial = run_index)
        tmpfile = "{}/{}".format(SERVER_MNT_PARENTS[i], os.environ["SERVER_TMP"])
        server_proc = run_dash.start_dash_server(log_folder, log_name, server, server_mount, tmpfile)
        server_proc.start()
        debug("Started server {}".format(i))
    time.sleep(5)

    ## now run the dash thing
    cmds = ["./run.sh"]
    try:
        env['TIMECOMMAND'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(ROOT_DIR, result_path, '{}.log'.format(run_index)))
        env['OUTPUTFILE'] = '{output}'.format(
            output=os.path.join(ROOT_DIR, result_path, '{}-output.log'.format(run_index)))
        debug("time command: {}".format(env['TIMECOMMAND']))
        sh.check_call(cmds, env = env)
        success = True
    except:
        debug('test failed')
        try:
            os.rename(os.path.join(result_path, '{}.log'.format(run_index)), os.path.join(result_path, '{}.log.failed'.format(run_index)))
        except:
            pass

        
    ## kill the 5 dash servers
    for i in range(len(SERVERS)):
        server = SERVERS[i]
        run_dash.kill_dash_server(server)

    
    if success:
        return True
    else:
        return False
def run_baseline_test(env, test_name, run_index, result_path):
    cmd = ["./run.sh"]
    try:
        env['TIMECOMMAND'] = '/usr/bin/time --output={output} --verbose'.format(
            output=os.path.join(ROOT_DIR, result_path, '{}.log'.format(run_index)))
        env['OUTPUTFILE'] = '{output}'.format(
            output=os.path.join(ROOT_DIR, result_path, '{}-output.log'.format(run_index)))
        sh.check_call(cmd, env = env)
        return True
    except:
        debug('test failed')
        try:
            os.rename(os.path.join(result_path, '{}.log'.format(run_index)), os.path.join(result_path, '{}.log.failed'.format(run_index)))
        except:
            pass
    return False


def main():
    folder_name = sys.argv[1]
    app_name = sys.argv[2]
    test_name = sys.argv[3]
    assert("distributed" in test_name or "comm" in test_name)
    trial_number = int(sys.argv[4]) if len(sys.argv) > 4 else 0
    run_tests(folder_name, app_name, test_name, trial_number)

if __name__ == '__main__':
    if len(sys.argv) == 0:
        os.abort()
    if len(sys.argv) < 4 or len(sys.argv) > 5:
        usage(sys.argv[0])
        sys.exit(1)

    # move to the experiment directory.
    os.chdir(ROOT_DIR)
    main()

