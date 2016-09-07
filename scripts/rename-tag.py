#!/usr/bin/python3

# OS Input / Output
#from os.path import isfile, join
import sys

from subprocess import Popen
from subprocess import PIPE

def find_focused_tag():
    out = Popen(['herbstclient tag_status'], shell=True, stdout=PIPE)
    tag = [line.decode('utf-8') for line in out.stdout][0].split('\t')
    tag = tag[['#' in name for name in tag].index(True)][1:]
    out.terminate()
    return(tag)

default = ['email', 'web', 'project', 'mri', 'bio', 'neuro', 'genes', 'clinical', 'help']
default = '\n'.join(default)

def define_new_tag_name(default):
    out = Popen(['echo "' + default + '" | dmenu'], shell=True, stdout=PIPE)
    tag = [line.decode('utf-8').rstrip() for line in out.stdout][0]
    out.terminate()
    return(tag)

if __name__:
    rename = 'herbstclient rename'
    oldtag = find_focused_tag()
    newtag = define_new_tag_name(default)
    out = Popen([' '.join([rename, oldtag, newtag])], shell=True, stdout=PIPE)
    out.terminate()
    print('Renamed tag from "', oldtag, '" to "', newtag, '"')
