"""
Experiment runner for dash evaluation.
Heavily inspired by gg's results eval:
    https://github.com/StanfordSNR/gg-results/blob/master/run-test
"""
import os
import sys
DEFAULT_ENV = os.environ.copy()
ROOT_DIR = os.path.abspath(os.path.dirname(__file__))
RESULTS_DIR = os.path.join(ROOT_DIR, 'results')

def usage(argv0):
    print("{} <app-name> <test-name> [repeat-count=10]".format(argv0))


def prepare_folders(program_name, test_name):
    path = os.path.join(RESULTS_DIR, program_name, test_name)

    if os.path.exists(path):
        raise Exception("Experiment folder already exists, remove manually.")
    os.makedirs(path, exist_ok = False)
    return path

def run_tests(app_name, test_name, repeat_count):
    result_path = prepare_folders(program_name, test_name)
    program_path = os.path.join(ROOT_DIR, 'apps', program_name)
    
    ## 1: start the server on the remote machine (on a separate thread???)


    ## 2: start the client locally (running Dash)

def main():
    app_name = sys.argv[1]
    test_name = sys.argv[2]
    repeat_count = int(sys.argv[3]) if len(sys.argv) == 4 else 10
    run_tests(app_name, test_name, repeat_count)

if __name__ == '__main__':
    if len(sys.argv) == 0:
        os.abort()
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        usage(sys.argv[0])
        sys.exit(1)
    
    # move to the experiment directory.
    os.chdir(ROOT_DIR)
    main()
