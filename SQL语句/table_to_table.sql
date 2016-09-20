从表A,复制字段,到表B(表B必须存在)
Insert into pay.commodity(cid,ctype,cname,info,price,coin,days,platform,iospayid,stat) select id,type,name,info,money,coin,days,paytype,iapid,stat from yuanfenba_www.product;