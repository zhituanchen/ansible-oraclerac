#!/usr/bin/expect -f


set timeout 30
spawn  /bin/sh /tmp/sshUserSetup.sh -user grid -hosts "{{ oracle_rac_cluster_servers_group[0] }} {{ oracle_rac_cluster_servers_group[1] }}" -advanced –noPromptPassphrase
expect "Enter passphrase (empty for no passphrase):"
send \r
expect "Enter same passphrase again:"
send \r
expect "*password:*"
send grid\n
expect "*password:*"
send grid\n
expect "*password:*"
send grid\n
expect "*password:*"
send grid\n
expect off


set timeout 20
spawn ssh grid@{{rac_node_name}}02 date
expect "Are you sure you want to continue connecting (yes/no)?*"
send yes\r
expect off
