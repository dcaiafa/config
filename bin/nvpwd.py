# /// script
# dependencies = ["pynvim"]
# ///

from pynvim import attach
import os, sys


addr = os.environ["NVIM"]
if not addr:
    sys.exit(2)

nvim = attach("socket", path=addr)
print(nvim.eval("getcwd()"))
