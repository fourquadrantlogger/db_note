# 快
SELECT NAME FROM USERS WHERE PRICE=100;
# 用程序拼接 name s
SELECT * FROM Persons WHERE LastName IN ('Adams','Carter')

# 慢
SELECT NAME FROM USERS WHERE PRICE=100;
# 用程序拼接 name s
for{
SELECT * FROM Persons WHERE LastName =name
}
