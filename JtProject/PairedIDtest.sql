-- test with pairedID
DROP DATABASE ecommjava;
# create database and use it
CREATE DATABASE IF NOT EXISTS ecommjava;
USE ecommjava;

# create the customer table
CREATE TABLE IF NOT EXISTS CUSTOMER(
id       int unique key not null auto_increment primary key,
email    varchar(255) null,
password varchar(255) null,
role     varchar(255) null,
username varchar(255) null,
accumulatedPurchases double null,
customBasket varchar(1024) null # a Jason object so that we can store product name and quantity 
);

# insert default customers
INSERT INTO CUSTOMER(email, password, role, username, accumulatedPurchases, customBasket) VALUES
('admin@nyan.cat', '123', 'ROLE_ADMIN', 'admin', 0.0 , 'customBasket'),
('lisa@gmail.com', '765', 'ROLE_NORMAL', 'lisa', 0.0 , 'customBasket'),
('amrit@gmail.com', 'password', 'ROLE_NORMAL', 'amrit', 0.0 , 'customBasket'),
('yupei@gmail.com', 'password', 'ROLE_NORMAL', 'yupei', 0.0 , 'customBasket');


# create the product table
CREATE TABLE IF NOT EXISTS PRODUCT(
product_id  int unique key not null auto_increment primary key,
image       varchar(255) null,
name        varchar(255) null,
price       int null,
quantity    int null,
pairedID int null
-- FOREIGN KEY (pairedID) REFERENCES PRODUCT(product_id)
);

# insert default products
INSERT INTO PRODUCT(image, name, price, quantity, pairedID) VALUES
('https://freepngimg.com/save/9557-apple-fruit-transparent/744x744', 'Apple', 3, 40 , 3),
('https://www.nicepng.com/png/full/813-8132637_poiata-bunicii-cracked-egg.png', 'Cracked Eggs', 1, 90 ,2),
('https://www.nicepng.com/png/detail/923-9237061_orange-naranja-orange-slide-middle-media-naranja-png.png', 'Orange', 3, 40, 1);
-- ('https://www.nicepng.com/png/detail/14-146654_free-png-pear-png-images-transparent-pear-png.png', 'Pear', 3, 60 ,1),
-- ('https://www.nicepng.com/png/detail/45-455648_berry-vector-acai-strawberry-clipart-transparent-background.png', 'Strawberry', 2, 40 , 2),
-- ('https://www.nicepng.com/png/detail/51-510169_cherries-clipart-red-cherry-cherry-fruit-png.png', 'cherry', 2, 40 , 3),
-- ('https://www.nicepng.com/png/detail/16-161611_blueberries-png-blueberry-png.png', 'blueberry', 2, 40 , 4);

# create coupon table
CREATE TABLE IF NOT EXISTS COUPON (
coupon_id int unique key not null auto_increment primary key,
customer_id int, 
FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)
);

INSERT INTO COUPON(customer_id) VALUES
(1), (1), (1), (1), (2), (3), (2), (3), (2), (1), (2), (3), (1);
-- if the coupon is used, just delete it. 

select * from Product;
