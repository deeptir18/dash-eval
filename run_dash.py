from fabric import Connection
import multiprocessing
import os
from run_tests import debug

def dash_server(logfolder, logname):
    cxn = Connection(host = os.environ["SERVER"],
                    user = os.environ["USERNAME"],
                    port = 22,
                    connect_kwargs = {"key_filename": os.environ["KEY"]})
    ## start the tmpfiles
    setup_cmd = "mkdir -p {logfolder}".format(logfolder = logfolder)
    cxn.run(setup_cmd)
    logpath = "{logfolder}/{logname}".format(logfolder = logfolder, logname = logname)
    cmd = "{binary} --folder {folder} --ip_address {client} --tmpfile {tmp} > {logpath} 2>&1".format(binary = os.environ["SERVER_BINARY"],
                folder = os.environ["SERVER_MOUNT"],
                client = os.environ["CLIENT"],
                tmp = os.environ["SERVER_TMP"],
                logpath = logpath)
    debug("Starting Dash Server: {}".format(cmd))
    try:
        res = cxn.run(cmd, hide = True) # there should be no output
        res.stdout.strip()
    except:
        pass

def kill_dash_server():
    cxn = Connection(host = os.environ["SERVER"],
                    user = os.environ["USERNAME"],
                    port = 22,
                    connect_kwargs = {"key_filename": os.environ["KEY"]})
    try:
        cxn.sudo("kill -9 `ps aux | grep {binary} | awk '{{print $2}}' | head -1 `".format(binary=os.environ["SERVER_BINARY"]), hide=True)
        cxn.sudo("kill -9 `ps aux | grep {binary} | awk '{{print $2}}' | head -1 `".format(binary=os.environ["SERVER_BINARY"]), hide=True)
        debug("Killed dash server")
        return True
    except:
        debug("Failed to kill dash server")
        return False

def start_dash_server(logfolder, logname):
    # should inherit environment vars set in parent
    server_proc = multiprocessing.Process(target = dash_server, args = (logfolder, logname))
    return server_proc
