from fabric import Connection
import multiprocessing
import os
from run_tests import debug
def dash_server(logfolder, logname, server = None, server_mount = None, tmpfile = None, separate_proxy = False):
    if server is None:
        server = os.environ["SERVER"]
    if server_mount is None:
        server_mount = os.environ["SERVER_MOUNT"]
    if tmpfile is None:
        tmpfile = os.environ["SERVER_TMP"]
    if os.getenv("PROXY_SERVER") is not None and separate_proxy:
        server = os.environ["PROXY_SERVER"]
        server_mount = os.environ["PROXY_SERVER_MOUNT"]
        tmpfile = os.environ["PROXY_SERVER_TMP"]
    cxn = Connection(host = server,
                    user = os.environ["USERNAME"],
                    port = 22,
                    connect_kwargs = {"key_filename": os.environ["KEY"]})
    ## start the tmpfiles
    setup_cmd = "mkdir -p {logfolder}".format(logfolder = logfolder)
    cxn.run(setup_cmd)
    logpath = "{logfolder}/{logname}".format(logfolder = logfolder, logname = logname)
    cmd = "{binary} --folder {folder} --ip_address {client} --tmpfile {tmp} > {logpath} 2>&1".format(binary = os.environ["SERVER_BINARY"],
                folder = server_mount,
                client = os.environ["CLIENT"],
                tmp = tmpfile,
                logpath = logpath)
    debug("Starting Dash Server: {}".format(cmd))
    try:
        res = cxn.run(cmd, hide = True) # there should be no output
        res.stdout.strip()
    except:
        pass

def kill_dash_server(server = None, separate_proxy = False):
    if server is None:
        server = os.environ["SERVER"]
        if os.getenv("PROXY_SERVER") is not None and separate_proxy:
            server = os.environ["PROXY_SERVER"]
    cxn = Connection(host = server,
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

def start_dash_server(logfolder, logname, server = None, server_mount = None, tmpfile = None, separate_proxy = False):
    # should inherit environment vars set in parent
    server_proc = multiprocessing.Process(target = dash_server, args = (logfolder, logname, server, server_mount, tmpfile, separate_proxy))
    return server_proc
