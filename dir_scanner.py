import os
import subprocess

cmd = "find ~/* | xargs ls -latr 2>/dev/null > res.log"

os.system(cmd)

with open('res.log', 'r') as f:
    for line in f:
        print(line)