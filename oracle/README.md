# 创建交换分区
```
sudo fallocate -l 512m /mnt/512MiB.swap
sudo chmod 600 /mnt/512MiB.swap
sudo mkswap /mnt/512MiB.swap
sudo swapon /mnt/512MiB.swap
```
# 拉镜像

pull jaspeen/oracle-11g
# 执行
sudo docker run -d --name oracle11g -p 1521:1521 -v /opt/:/install -v /media/timeloveboy/DATASET/oracledmp:/opt/oracle/dpdump  jaspeen/oracle-11g
 
# 登录
sudo docker exec -it oracle11g /bin/bash

su oracle
# 具体SID请查看oracle服务的日志
export ORACLE_SID=orcl

# sql developer登录
sqlplus
system/oracle


