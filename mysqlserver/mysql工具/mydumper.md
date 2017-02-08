从 MySQL 导出数据

我们使用 mydumper 从 MySQL 导出数据，如下:

./bin/mydumper -h 127.0.0.1 -P 3306 -u root -t 16 -F 128 -B test -T t1,t2 -o ./var/test
上面，我们使用 -B test 表明是对 test 这个 database 操作，然后用 -T t1,t2 表明只导出 t1，t2 两张表。

-t 16 表明使用 16 个线程去导出数据。-F 128 是将实际的 table 切分成多大的 chunk，这里就是 128MB 一个 chunk。

注意：在阿里云等一些需要 super privilege 的云上面，mydumper 需要加上 --no-locks 参数，否则会提示没有权限操作。
向 TiD
