#!/usr/bin/expect -f

set timeout 30
spawn  /bin/sh /tmp/sshUserSetup.sh -user oracle -hosts "{{ oracle_rac_cluster_servers_group[0] }} {{ oracle_rac_cluster_servers_group[1] }}" -advanced –noPromptPassphrase
expect "Enter passphrase (empty for no passphrase):"
send \r
expect "Enter same passphrase again:"
send \r
expect "*password:*"
send oracle\n
expect "*password:*"
send oracle\n
expect "*password:*"
send oracle\n
expect "*password:*"
send oracle\n
expect off

set timeout 20
spawn ssh oracle@{{ rac_node_name }}02 date
expect "Are you sure you want to continue connecting (yes/no)?*"
send yes\r
expect off
