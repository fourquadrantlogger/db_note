# TokuDB 

是一个高性能、支持事务处理的 MySQL 和 MariaDB 的存储引擎。TokuDB 的主要特点则是对高写压力的支持。

它使用索引加快查询速度，具有高扩展性，并支持hot scheme modification。

# 特点：
+ 1.插入性能快20~80倍；
+ 2.压缩数据减少存储空间；
+ 3.数据量可以扩展到几个TB；
+ 4.不会产生索引碎片；
+ 5.支持hot column addition ， hot indexing， mvcc；

如何考虑使用：
+ 1.如果要存储blob，不要使用tokuDB，因为他的记录不能太大；
+ 2.如果记录数过亿，使用tokuDB；
+ 3.如果注重update的性能，不要使用tokuDB，他没有innodb快；
+ 4.如果要存储旧的记录，使用tokuDB；
+ 5.如果要缩小数据占用的存储空间，使用tokuDB；__