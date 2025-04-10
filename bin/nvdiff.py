# /// script
# dependencies = ["pynvim"]
# ///

import os
import sys

from pynvim import attach


args = sys.argv[1:]
if len(args) < 2:
    print("Usage: {} <filename> <filename>".format(sys.argv[0]))
    sys.exit(1)


addr = os.environ.get("NVIM", None)
if not addr:
    os.execvp('nvim', args)

nvim = attach("socket", path=addr)


def fullpath(*args):
    _p = os.path
    return _p.abspath(_p.normpath(_p.expanduser(_p.join(*args))))
    del _p

def _setup():
    global termbuf
    nvim.input('<c-\\><c-n>')  # exit terminal mode
    nvim.command
    chid = nvim.channel_id
    termbuf = nvim.eval('bufnr("%")')
    nvim.vars['file_to_edit1'] = fullpath(args[0])
    nvim.vars['file_to_edit2'] = fullpath(args[1])
    nvim.command('tabnew')
    nvim.command('exe "edit " . g:file_to_edit2')
    nvim.command('diffthis')
    nvim.command('exe "vert diffsplit " . g:file_to_edit1')
    nvim.command('wincmd w')
    nvim.command('setlocal bufhidden=wipe')
    nvim.command('augroup TERMEDIT')
    nvim.command('highlight StatusLine ctermfg=red')
    nvim.command('au BufUnload <buffer> call rpcnotify({0}, "n")'.format(chid))
    nvim.command('au BufEnter <buffer> highlight StatusLine ctermfg=red')
    nvim.command('au BufLeave <buffer> highlight StatusLine ctermfg=blue')
    nvim.command('augroup END')
    nvim.command('wincmd w')
    nvim.command('setlocal bufhidden=wipe')
    nvim.command('wincmd w')

def _exit(*a, **kw):
    try:
        nvim.vars['file_to_edit1'] = None
        nvim.vars['file_to_edit2'] = None
        swb = nvim.eval("&swb")
        nvim.command('set swb=useopen,usetab')
        nvim.command('augroup TERMEDIT')
        nvim.command('au!')
        nvim.command('augroup END')
        nvim.command('tabclose')
        nvim.command('sb %s' % termbuf)
        nvim.command('set swb=' + (swb or ''))
        nvim.input('i')
        nvim.stop_loop()
    except:
        import traceback
        traceback.print_exc()
        sys.stdout.flush()
        sys.stderr.flush()
        sys.exit(1)


nvim.run_loop(_exit, _exit, _setup)
