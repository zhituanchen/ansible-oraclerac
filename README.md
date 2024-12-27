# ansible-oraclerac
use ansible playbook scripts auto install oracle 19c rac database

# Quick Start
## system and db info
```markdown
system: centos 7
db: 19C 
```

## ansible hosts
```markdown
[oracle_rac]
10.x.x.xx2 ansible_user=root ansible_ssh_pass=kd11111 cluster_role=node1
10.x.x.xx3 ansible_user=root ansible_ssh_pass=kd11111 cluster_role=node2
```

## ansible var
```markdown
cat main.yml
---

# OS 安装包及用户密码及目录及节点主机名称前缀名设置
soft_dir: /home/soft
oracle_passwd: oracle
oracle_base_dir: /u01/app
rac_node_name: rac

# RAC IP 数据库的VIP privip publicIP 网卡的名称设置，注意公网私网设置
rac1vip: 10.x.x.xx0
rac2vip: 10.x.x.xx1
rac1privip: 192.xxx.xxx.xx2
rac2privip: 192.xxx.xxx.xx3
racscanip: 10.x.x.xx9
racpublicfcname: ens192
racprivfcname: ens224

# DB 数据库实例名 字符集 
oracle_sid: orcl
characterset: ZHS16GBK

# Diskgroup ocr data 磁盘组属性设置 ocr盘组的路口名称 ocr盘信息跟failure设置注意中间多了逗号 data数据盘设置（多个用逗号隔开）网卡列表信息设置（注意公网私网IP信息对应,注意最后位是0）
ocrp_redundancy: NORMAL
data_redundancy: EXTERNAL
basedisk_path: /dev/oracleasm/disks/ASM*
ocrp_failure_basedisk: /dev/oracleasm/disks/ASM_OCRB,,/dev/oracleasm/disks/ASM_OCRC,,/dev/oracleasm/disks/ASM_OCRD
ocrp_basedisk: /dev/oracleasm/disks/ASM_OCRB,/dev/oracleasm/disks/ASM_OCRC,/dev/oracleasm/disks/ASM_OCRD
data_basedisk: /dev/oracleasm/disks/ASM_DATAE
network_interface_list: ens192:10.x.x.0:1,ens224:192.168.xxx.0:5

# Soft grid db 数据库软件安装包信息
oracle_grid_soft: LINUX.X64_193000_grid_home.zip
oracle_grid_soft_md5: b7c4c66f801f92d14faa0d791ccda721
oracle_oracle_soft: LINUX.X64_193000_db_home.zip
oracle_oracle_soft_md5: 1858bd0d281c60f4ddabd87b1c214a4f
download_target: /home/soft

```

# Notice
These scripts are optimized based on the installation processes shared by users online. If there is any infringement, please contact me in time to delete them.
