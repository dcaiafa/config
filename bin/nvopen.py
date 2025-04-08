# /// script
# dependencies = ["pynvim"]
# ///

import argparse
import os, sys
import os.path

from pynvim import attach


argsp = argparse.ArgumentParser(
        usage="%(prog)s <file> [pos]",
        description="Open file in nvim")
argsp.add_argument("file")
argsp.add_argument("pos", nargs="?")
args = argsp.parse_args()

addr = os.environ["NVIM"]
if not addr:
    sys.exit(2)

nvim = attach("socket", path=addr)
def escapePath(name):
    return os.path.abspath(name).replace(" ", "\\ ")

# Leave terminal mode if necessary.
nvim.feedkeys('', "n")

if args.pos:
    for pos in args.pos:
        nvim.command("wincmd " + pos)

nvim.command("drop {}".format(escapePath(args.file)))
