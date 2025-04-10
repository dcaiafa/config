# /// script
# dependencies = ["pynvim"]
# ///

import os
import sys

from pynvim import attach


args = sys.argv[1:]
args = [os.path.abspath(f) for f in args]

if not args:
    print("Usage: {} <filename> ...".format(sys.argv[0]))
    sys.exit(1)

addr = os.environ.get("NVIM", None)
if not addr:
    os.execvp('nvim', args)

nvim = attach("socket", path=addr)

def _setup():
    nvim.input('<c-\\><c-n>')  # exit terminal mode
    chid = nvim.channel_id
    nvim.command('augroup EDIT')
    nvim.command('au BufEnter <buffer> call rpcnotify({0}, "n")'.format(chid))
    nvim.command('au BufEnter <buffer> startinsert'.format(chid))
    nvim.command('augroup END')
    nvim.vars['files_to_edit'] = args[0]
    #nvim.command('exe "drop ".g:files_to_edit')
    nvim.command('exe "below new ".g:files_to_edit')

def _exit(*args):
    nvim.vars['files_to_edit'] = None
    nvim.command('augroup EDIT')
    nvim.command('au!')
    nvim.command('augroup END')
    nvim.stop_loop()

nvim.run_loop(_exit, _exit, _setup)
