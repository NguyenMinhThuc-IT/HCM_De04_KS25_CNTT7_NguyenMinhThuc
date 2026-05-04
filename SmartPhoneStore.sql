create database SmartPhoneStore;

use SmartPhoneStore;

create table Product(
	product_id int primary key auto_increment,
    product_name varchar(50) not null ,
    product_type varchar(20) not null,
    product_price decimal,
    product_inventory decimal
);

-- khách hàng 
create table Customer(
	customer_id int primary key auto_increment,
    customer_name varchar(50) not null,
    customer_email varchar(50) not null,
    customer_phone varchar(15) not null, 
    customer_level varchar(20) null
);

-- Orders: Mã đơn hàng, Ngày đặt hàng, Tổng tiền.
create table Orders (
	order_id int primary key auto_increment,
    order_day date, 
    order_sum_price decimal
);

-- Order_Detail: (Mã đơn hàng), Mã sản phẩm, Số lượng mua, Giá bán thực tế.
create table Order_Detail(
	order_detail_quantity int, --  số lượng mua
    order_detail_price_TT int,-- giá bán thực tế 
    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Product(product_id)
);

insert into Product( product_name, product_type, product_price, product_inventory ) value
("IPhone 18 Pro Max", "Electronics", 60000000, 20),
("Watch", "Accessories", 2000000, 12),
("Ipad Pro5", "Electronics", 20000000, 2),
("SamSung S29 E", "Electronics", 29000000, 5),
("Aripro", "Accessories", 3000000, 10);

insert into Customer( customer_name, customer_email, customer_phone  )value
("Do Minh Tien", "dominhtien@gmail.com", 012345678),
("Le Ha Thanh Sang", "Sangle2000@gmail.com", 0909999965),
("La Duy Khang", "khanglaNotLove@gmail.com", 02773444444),
("Kim Thanh Dat", "kimdat123@gmai.com", 0111111111),
("Nguyen Van Thong", "thongdepzai99@gmail.com", 0121212121);

insert into Orders( order_day, order_sum_price )value
("2026-05-20", 100000000),
("2026-05-23", 0),
("2026-05-12", 90000000),
("2026-06-20", 170000000),
("2026-05-22", 150000000);

insert into Order_Detail(order_detail_quantity, order_detail_price_TT )value
(24, 4555555),
(12, 1999999),
(11, 30000000),
(4, 40000000),
(5, 8330000);

SET SQL_SAFE_UPDATES = 0;
update Product
set product_price = product_price * 0.9
where product_type = 'Accessories';
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
delete from Orders
where order_sum_price = 0;
SET SQL_SAFE_UPDATES = 1;

select * from Product;

