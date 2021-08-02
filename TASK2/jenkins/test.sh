#!/bin/bash
HOST="$1"
DIR=$2

#echo "ssh -i /home/jenkins/.ssh/id_rsa root@$host ls $dir"
#ssh -i /home/jenkins/.ssh/id_rsa root@$host ls $dir

echo "ssh -i /home/jenkins/.ssh/id_rsa root@$HOST "find $DIR | xargs ls""
ssh -i /home/jenkins/.ssh/id_rsa root@$HOST "find $DIR -type d | xargs ls" > Folders.log
ssh -i /home/jenkins/.ssh/id_rsa root@$HOST "find $DIR -type f | xargs ls" > files.log

