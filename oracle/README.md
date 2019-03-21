# 创建交换分区
```
sudo fallocate -l 512m /mnt/512MiB.swap
sudo chmod 600 /mnt/512MiB.swap
sudo mkswap /mnt/512MiB.swap
sudo swapon /mnt/512MiB.swap
```
# 拉镜像

pull jaspeen/oracle-11g

# 登录

system/oracle
