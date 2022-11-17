1)Difference between DDL and DML is that DML is used to access, modify or retrieve the data from the database, whereas DDL is used to specify the database schema database structure.
 a)-CREATE(create table/tablespace/...);
 -DROP(drop table/database/...); 
-ALTER(ALTER TABLE table_name ADD column_name …).
 
b)-INSERT(INSERT INTO table_name() VALUES();); 
UPDATE(UPDATE table_name SET … WHERE …); 
-DELETE(DELETE FROM table_name WHERE …). 
-SELECT(SELECT columns... FROM table_name);

----------------------------------------------------------------------------------------- 
2)
create table customers(
     Id	 SERIAL PRIMARY KEY,
     full_name	  VARCHAR(50),
     timestamp_       TIMESTAMP ,
     delivery_address TEXT
 );
 create table orders(
     code 	INT PRIMARY KEY, 
     customer_id       INT REFERENCES customers(id) on update cascade on delete cascade,
     total_sum      DOUBLE PRECISION, 
     is_paid       BOOLEAN
 ); 
drop table order_items;
create table order_items( 
      order_code       INT REFERENCES orders(code) on update cascade on delete cascade,
      product_id     VARCHAR REFERENCES products(id) on update cascade on delete cascade, 
      quantity      INT,
      UNIQUE(order_code,product_id)
 ); 
create table products( 
     id 	VARCHAR PRIMARY KEY,
     name_ 	VARCHAR NOT NULL UNIQUE,
     description 	TEXT,
     price 	DOUBLE PRECISION 
); 
----------------------------------------------------------------------------
3) 
create table student( 
    full_name	VARCHAR(50) PRIMARY KEY,
    age 		INT,
    birth_date 	DATE,
    gender	 VARCHAR,
    average_grade 	DOUBLE PRECISION,
   description 		TEXT,
   dormitory_status 	BOOLEAN,
   other 			TEXT 
); 
create table instructor( 
    full_name 	VARCHAR(50) PRIMARY KEY,
    languages 	VARCHAR,
    work_experience 	TEXT, 
    remote_lessons 	BOOLEAN 
); 
create table lesson_partisipants( 
    lesson_title 		VARCHAR,
    teaching instructor     VARCHAR REFERENCES instructor(full_name),
    studying_students 	TEXT,
    room_number	 INT ); 
 
4)
   INSERT INTO customers (full_name,timestamp,delivery_address) 
   VALUES ('Mar',now(),Жарокова 33а'); 
   
   UPDATE customers
   SET delivery_address = 'Маметова 24б'
   WHERE full_name = 'Mar';

   DELETE FROM customers WHERE full_name = 'Mar';
