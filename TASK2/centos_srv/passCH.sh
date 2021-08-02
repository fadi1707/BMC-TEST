#/bin/bash

. //data/.env

n=0;
if [ n==0 ]
 then
  service sshd restart
fi
echo $pass 
echo "Please Give Root Password"
/usr/bin/expect << EOF
  spawn passwd root
    expect "New password:"
      send "$pass\r"
    expect "Retype new password:"
      send "$pass\r"


  spawn ssh-keygen -t rsa
    expect "Enter file in which to save the key (/home/youruser/.ssh/id_rsa):"
      send "\r"
    expect "Enter passphrase (empty for no passphrase):"
      send "\r"
    expect "Enter same passphrase again:"
      send "\r"
EOF

echo "$key" >> .ssh/authorized_keys
#exit 0