# Innodb

## 事务控制等特性

对事务安全的支持

+ 未提交读（read uncommitted）
+ 提交读（read committed）
+ 重复读（repeatable read）
+ 串行读（serializable）

不同的隔离级别有不同的现象，并有不同的锁定/并发机制，隔离级别越高，数据库的并发性就越

Innodb默认的 REPEATABLE READ 隔离级

对于不同的事务，采用不同的隔离级别分别有不同的结果。不同的隔离级别有不同的现象。主要有下面3种现在：

1、脏读（dirty read）：一个事务可以读取另一个尚未提交事务的修改数据。

2、非重复读（nonrepeatable read）：在同一个事务中，同一个查询在T1时间读取某一行，在T2时间重新读取这一行时候，这一行的数据已经发生修改，可能被更新了（update），也可能被删除了（delete）。

3、幻像读（phantom read）：在同一事务中，同一查询多次进行时候，由于其他插入操作（insert）的事务提交，导致每次返回不同的结果集。
## 锁定机制

实现了行锁