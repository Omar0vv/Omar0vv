create table Boxes(
 	           code character(4) PRIMARY KEY ,
 	           contents varchar(255), 
value real,
warehouse integer,
 	           foreign key(warehouse) references Warehouse(code) 
);
 
drop table Warehouse;
create table Warehouse(
code integer PRIMARY KEY ,
location varchar(255),
 	           capacity integer 
);
 insert into Warehouse
 VALUES (1, 'Chicago', 3),(2, 'Chicago', 4), (3, 'New York', 7),(4, 'Los Angeles', 2), (5, 'San    Francisco', 8);

 insert into Boxes
 values('OMN7', 'Rocks', '180', '3'),('4H8P', 'Rocks', '250', '1'),('4RT3', 'Scissors','190', '4'), ('7G3H', 'Rocks', '200', '1'),('8JN6', 'Papers', '75', '1'),('8Y6U', 'Papers', '50', '3'), ('9J6F', 'Papers', '175', '2'),('LL08', 'Rocks', '140', '4'),('POH6', 'Scissors', '125', '1'), ('P2T6', 'Scissors', '150', '2'),('TU55', 'Papers', '90', '5'); 

--4 
select * from Warehouse; 
--5 
select * from boxes where value > 150; 
--6 
select distinct contents from Boxes; 
--7 
select warehouse, count(warehouse) from boxes 
group by warehouse order by count(warehouse); 
--8 
select warehouse, count(warehouse) from boxes
group by warehouse having count(warehouse) > 2;
 --9 
insert into warehouse 
values (6, 'New York', 3);
 --10 
select * from boxes; 
insert into boxes 
values('H5RT', 'Papers', '200', 2); 
--11 
select * from boxes order by value;
update boxes set value = value * 15/100 
where value = (SELECT distinct value 
FROM Boxes ORDER BY value DESC 
LIMIT 1 offset 2) 
returning *; 
--12 
delete from boxes 
where value < 150; 
--13 
delete from boxes
where warehouse in (select code from warehouse where location = 'New York') returning *;
 select * from boxes;
