create database ecommerce;
use ecommerce;

create table product(
	product_code varchar(20) not null,
    title varchar(200) not null,
    ori_price int,
    discount_price int,
    discount_percent int,
    delibery varchar(2),
    primary key(product_code));
    