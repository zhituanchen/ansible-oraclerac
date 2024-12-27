# ansible-oraclerac
use ansible playbook scripts to install oracle rac database 19c

# Quick Start
ansible hosts
[oracle_rac]
10.x.x.xx2 ansible_user=root ansible_ssh_pass=kd11111 cluster_role=node1
10.x.x.xx3 ansible_user=root ansible_ssh_pass=kd11111 cluster_role=node2
