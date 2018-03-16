#!/usr/bin/python

import os
import datetime
import shutil
from subprocess import call

assignment_num = "2"
path = "results.txt"
log = "result_log"
if not os.path.exists(log):
    os.makedirs(log)

while True:
    call(["os161-tester", "-V", "-m", assignment_num])
    f = open("os161-tester-071.log", "r")
    m = f.read()
    f.close()
    r = open(path, "a+")
    ts = "\nTimestamp: {:%Y-%m-%d %H:%M:%S}\n".format(datetime.datetime.now())
    dr_name = "{:%Y-%m-%d_%H:%M:%S}".format(datetime.datetime.now())
    r.write(ts)
    r.write(m)
    r.close()
    dir_path = log + "/" + dr_name
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)
    shutil.copy2("os161-071.log", dir_path) 
    shutil.copy2("os161-mark-071.txt", dir_path) 
    shutil.copy2("os161-marker-071.log", dir_path) 
    shutil.copy2("os161-tester-071.log", dir_path) 
