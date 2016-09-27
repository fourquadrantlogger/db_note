#explain命令

explain select name from groups where id in ( select group_id from user_group where user_id = 1)