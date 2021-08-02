import os
import subprocess

cmd = "find / | xargs ls -latr 2>/dev/null > /var/log/res.log"

os.system(cmd)

with open('/var/log/res.log', 'r') as f:
    for line in f:
        print(line)