use bixin;
delimiter $ #以delimiter来标记用$表示存储过程结束
create procedure pro()
begin
declare i float;  #定义i变量
declare j float;  #定义j变量
set i=-180;
set j=-90;
while(i<180) do  #对学号的循环
    while(j<=90) do   #对课程号的循环
        insert into points(latitude,longitude) values(180*rand(),90*rand());
        set j=j+1;
    end while;
    set i=i+1;
    set j=1;    #重新给j赋值为1，让它下次继续从j=1开始进行立面的while循环
                #如果不给重新赋值为1，则对j的while循环只能进行一次
	end while;
end

pro()
