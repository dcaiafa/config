# /// script
# dependencies = ["pynvim"]
# ///

import os
import sys

from pynvim import attach


args = sys.argv[1:]
if len(args) != 1:
    print("Usage: {} <dir>".format(sys.argv[0]))
    sys.exit(1)


def fullpath(*args):
    _p = os.path
    return _p.abspath(_p.normpath(_p.expanduser(_p.join(*args))))
    del _p


addr = os.environ.get("NVIM", None)
if not addr:
    print("not in nvim, please cd manually")

nvim = attach("socket", path=addr)

nvim.vars['cd_to'] = fullpath(args[0])
nvim.command('exe "cd ".cd_to')
nvim.vars['cd_to'] = None
