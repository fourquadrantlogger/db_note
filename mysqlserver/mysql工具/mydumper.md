从 MySQL 导出数据

我们使用 mydumper 从 MySQL 导出数据，如下:

./bin/mydumper -h 127.0.0.1 -P 3306 -u root -t 16 -F 128 -B test -T t1,t2 -o ./var/test
上面，我们使用 -B test 表明是对 test 这个 database 操作，然后用 -T t1,t2 表明只导出 t1，t2 两张表。

-t 16 表明使用 16 个线程去导出数据。-F 128 是将实际的 table 切分成多大的 chunk，这里就是 128MB 一个 chunk。

注意：在阿里云等一些需要 super privilege 的云上面，mydumper 需要加上 --no-locks 参数，否则会提示没有权限操作。
向 TiD

## metadata
```
Started dump at: 2017-02-09 12:24:38
SHOW MASTER STATUS:
	Log: mysql-bin.000017
	Pos: 472216733
	GTID:5cf5609c-c0f8-11e6-bd2e-70106fac1402:1-191147546,
63725071-cc2c-11e6-863d-90e2bac76424:1-1926619023,
6af9ad69-c0f8-11e6-bd2f-246e9606bc20:1-2333629,
754ce879-cc2c-11e6-863e-70106faece18:1-434656600,
c3a378a3-ec7a-11e6-98e7-7cd30abeb32c:1-5475272

SHOW SLAVE STATUS:
	Host: 11.192.77.85
	Log: mysql-bin.000017
	Pos: 46409682
	GTID:5cf5609c-c0f8-11e6-bd2e-70106fac1402:1-191147546,
63725071-cc2c-11e6-863d-90e2bac76424:1-1926619023,
6af9ad69-c0f8-11e6-bd2f-246e9606bc20:1-2333629,
754ce879-cc2c-11e6-863e-70106faece18:1-434656600,
c3a378a3-ec7a-11e6-98e7-7cd30abeb32c:1-5475272

Finished dump at: 2017-02-09 13:07:19
```
导出 29亿 数据，耗时43分钟。
