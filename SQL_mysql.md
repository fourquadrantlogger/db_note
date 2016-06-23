
## 创建表

```
CREATE TABLE STU(ID int primary key,NAME text);
CREATE TABLE RECORD(ID int primary key,stuid int,lecture tinytext,score tinyint);

```

## 插入数据
```
insert into table(ID,NAME) values(1,'lipeng')
insert into table(ID,NAME) values(2,'zhangyue')

```

## 双表联合查询

```
SELECT STU.NAME,RECORD.lecture,RECORD.score FROM RECORD,STU WHERE RECORD.stuid=STU.ID ORDER BY RECORD.score DESC;
+----------+---------+-------+
| NAME     | lecture | score |
+----------+---------+-------+
| lipeng   | english |    99 |
| lipeng   | yuwen   |    99 |
| zhangyue | yuwen   |    89 |
| zhangyue | english |    79 |
+----------+---------+-------+
4 rows in set (0.00 sec)
```

## LIMIT

```
SELECT STU.NAME,RECORD.lecture,RECORD.score FROM RECORD,STU WHERE RECORD.stuid=STU.ID ORDER BY RECORD.score DESC LIMIT 1;
+--------+---------+-------+
| NAME   | lecture | score |
+--------+---------+-------+
| lipeng | english |    99 |
+--------+---------+-------+
1 row in set (0.00 sec)

```

## AVG 求平均
```
select avg(RECORD.score) from RECORD;
```