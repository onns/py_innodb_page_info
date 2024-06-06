create table t (
    a int unsigned not null auto_increment,
    b char(10),
    primary key(a)
) engine=InnoDB charset=utf8;

-- 使用自定义结束符
delimiter $$

-- 创建存储过程 load_t
CREATE PROCEDURE load_t(IN count INT UNSIGNED)
BEGIN
    DECLARE c INT DEFAULT 0;
    -- 开始循环插入数据
    WHILE c < count DO
        INSERT INTO t
        SELECT NULL, REPEAT(CHAR(97 + FLOOR(RAND() * 26)), 10);
        
        SET c = c + 1;
    END WHILE;
END$$

-- 恢复默认结束符
delimiter ;

-- 调用存储过程
CALL load_t(100);
