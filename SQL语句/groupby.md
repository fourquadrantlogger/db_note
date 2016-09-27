# 对结果集合,进行分组累加
SELECT Customer,SUM(OrderPrice) FROM Orders GROUP BY Customer