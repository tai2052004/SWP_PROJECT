create database HESH_website
go
use HESH_website 

create table Users
(
	ID int identity(1,1) primary key,
	User_name varchar(50),
	User_password varchar(50),
	User_email varchar(50),
	User_role varchar(30),
	User_fullname varchar(50),
	User_dob date,
	User_phone varchar(30),
	User_address varchar(100),
	User_gender varchar(30)
);

insert into Users(User_name,User_password,User_email,User_role) values
('ngocthien2503','ngocthien','ngocthien2902@gmail.com','user'),
('dckontum','kontumvn','dckontum@gmail.com','admin');
select * from Users
CREATE TABLE Coupon (
    coupon_id INT IDENTITY(1,1) PRIMARY KEY,      -- ID của mã giảm giá
    code VARCHAR(50) UNIQUE NOT NULL,              -- Mã giảm giá
    discount_name VARCHAR(100) NOT NULL,
    discount_value FLOAT NOT NULL,                  -- Giá trị giảm giá
    quantity INT NOT NULL,                          -- Số lượng mã giảm giá có sẵn
);

create table "Order" (
    order_id int identity(1,1) primary key,
    user_id int,          -- Người dùng đặt hàng
    order_date datetime,          -- Ngày đặt hàng
    status varchar(50),           -- Trạng thái đơn hàng: Pending, Confirmed, Shipped, Delivered, Canceled
    pay bit default 0,                  -- Trạng thái thanh toán: true nếu đã thanh toán, false nếu chưa
    total_price float,            -- Tổng giá trị đơn hàng
    feeship float,                -- Phí giao hàng
    address varchar(200),         -- Địa chỉ giao hàng của khách hàng
	coupon_id int,    -- Mã giảm giá đã áp dụng
    foreign key (user_id) references "Users"(ID),
	foreign key (coupon_id) references "Coupon"(coupon_id)
);

CREATE TABLE Product (
    product_id INT IDENTITY(1,1) PRIMARY KEY,  -- Sử dụng kiểu int với identity
    name VARCHAR(100),
    brand VARCHAR(50),
    price FLOAT,  -- Sử dụng kiểu float cho giá
    discount FLOAT,  -- Sử dụng kiểu float cho giảm giá
    description TEXT,
    image_urls TEXT,  -- Lưu nhiều URL hình ảnh
	status int
);

CREATE TABLE ProductDetail (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- ID tự động tăng
    product_id INT,  -- Kiểu int để liên kết với bảng Product
    size VARCHAR(10),
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)  -- Liên kết với bảng Product
);


create table OrderDetail (
    order_detail_id int identity(1,1) primary key,
    order_id int,       -- ID của đơn hàng
    product_detail_id int,     -- ID của sản phẩm
    quantity int,               -- Số lượng của sản phẩm này trong đơn hàng
    price float,                -- Giá tại thời điểm đặt (để không bị thay đổi khi giá gốc của sản phẩm thay đổi)
	total_price float,
    foreign key (order_id) references "Order"(order_id),
    foreign key (product_detail_id) references ProductDetail(id)
);

create table Comment (
    comment_id int identity(1,1) primary key,
    content varchar(500),
    star int,
    id_user int,
    product_id int,
    foreign key (id_user) references Users(ID),
    foreign key (product_id) references Product(product_id)
);

create table Favorite (
    favourite_id int identity(1,1) primary key,
    user_id int,
    product_id int,
    foreign key (user_id) references Users(ID),
    foreign key (product_id) references Product(product_id)
);

CREATE TABLE ShoppingCart (
    cart_id INT IDENTITY(1,1) PRIMARY KEY,   -- ID của giỏ hàng
    user_id INT,                              -- ID của người dùng
    FOREIGN KEY (user_id) REFERENCES "Users"(ID)  -- Liên kết với bảng Users
);

CREATE TABLE CartItem (
    cart_item_id INT IDENTITY(1,1) PRIMARY KEY,  -- ID của sản phẩm trong giỏ hàng
    cart_id INT,                                  -- ID của giỏ hàng
    product_id INT,                               -- ID của sản phẩm
    quantity INT,                                 -- Số lượng sản phẩm
    FOREIGN KEY (cart_id) REFERENCES ShoppingCart(cart_id),  -- Liên kết với bảng ShoppingCart
    FOREIGN KEY (product_id) REFERENCES Product(product_id)   -- Liên kết với bảng Product
);
CREATE TABLE Payment (
	payment_id int identity(1,1) primary key,
	payment_method varchar(20),
);


INSERT INTO Coupon (code, discount_name, discount_value, quantity) 
VALUES 
('SUMMER2024', 'COUPON FOR SUMMER 2024', 20, 100),
('FREESHIP', 'COUPON FOR FREESHIP', 50, 50),
('WELCOME10', 'WELCOME DISCOUNT', 10, 200),
('SAVE50', 'SAVE 50 ON PURCHASES OVER 1M', 50, 100),
('VIPCUSTOMER', 'SPECIAL DISCOUNT FOR VIP', 30, 300);


INSERT INTO Product (name, brand, price, discount, description, image_urls,status) 
VALUES 
('Reebok Club C Revenge', 'Reebok', 2350000, 0, 'Reebok Club C classic design, comfortable and stylish.', 'img/shoes_1.png', 1),
('Nike Air Max 270', 'Nike', 1930000, 0, 'Nike Air Max 270 with the signature air cushion, ideal for running.', 'img/shoes_5.png',1),
('New Balance 530', 'New Balance', 2050000, 0, 'New Balance 530, perfect for casual wear and sports.', 'img/shoes_2.png',1),
('Adidas Ultraboost', 'Adidas', 2700000, 0, 'Adidas Ultraboost provides unmatched comfort.', 'img/shoes_3.png',1),
('Converse Chuck 70', 'Converse', 1500000, 0, 'Classic high-top style with modern updates.', 'img/shoes_4.png',1),
('Puma Suede Classic', 'Puma', 1800000, 0, 'Iconic Puma Suede sneakers for everyday wear.', 'img/shoes_6.png',1);


--Reebok Club C Revenge
INSERT INTO ProductDetail (product_id, size, quantity) 
VALUES 
-- Reebok Club C Revenge
(1, '42', 10), (1, '43', 8), (1, '44', 6),
-- Nike Air Max 270
(2, '41', 12), (2, '42', 15), (2, '43', 9),
-- New Balance 530
(3, '40', 9), (3, '41', 11), (3, '42', 7),
-- Adidas Ultraboost
(4, '42', 20), (4, '43', 15), (4, '44', 10),
-- Converse Chuck 70
(5, '40', 14), (5, '41', 13), (5, '42', 12),
-- Puma Suede Classic
(6, '40', 8), (6, '41', 10), (6, '42', 9);


INSERT INTO "Order" (user_id, order_date, status, pay, total_price, feeship, address, coupon_id) 
VALUES 
(1, GETDATE(), 'Pending', 0, 200, 20, '12 My Da Tay 8, Da Nang', 1),
(2, GETDATE(), 'Confirmed', 1, 300, 15, '12 My Da Tay 8, Da Nang', 2),
(1, GETDATE(), 'Shipping', 1, 400, 25, '15 Tran Hung Dao, Da Nang', 3),
(2, GETDATE(), 'Delivered', 1, 500, 30, '22 Hai Ba Trung, Hanoi', 4),
(1, GETDATE(), 'Cancelled', 0, 100, 10, '8 Nguyen Trai, HCMC', 5);


INSERT INTO OrderDetail (order_id, product_detail_id, quantity, price) 
VALUES 
(1, 1, 2, 150),
(1, 2, 1, 180),
(2, 1, 1, 150),
(2, 2, 2, 180),
(3, 3, 1, 205),
(3, 4, 2, 270),
(4, 5, 3, 150),
(4, 6, 1, 180),
(5, 1, 1, 150),
(5, 4, 1, 270);


INSERT INTO Comment (content, star, id_user, product_id) 
VALUES 
('Great shoes!', 5, 1, 1),
('Not bad but a bit tight.', 4, 2, 2),
('Excellent quality and comfort.', 5, 1, 3),
('Average fit, not my style.', 3, 1, 4),
('Worth the price.', 5, 1, 5),
('Comfortable and stylish.', 5, 2, 6);


INSERT INTO Favorite (user_id, product_id) 
VALUES 
(1, 1), (2, 2), (1, 3), (1, 4), (1, 5), (2, 6);


INSERT INTO ShoppingCart (user_id) 
VALUES 
(1), (2);


INSERT INTO CartItem (cart_id, product_id, quantity) 
VALUES 
(1, 1, 2), (1, 2, 1), (2, 3, 1),
(1, 4, 1), (2, 5, 2);

INSERT INTO Payment (payment_method) 
VALUES 
('VNPAY'),
('Payment upon receipt');
select * from Product


SELECT 
    o.order_id,
    u.ID,
    p.name AS product_name,
	pd.size,
    od.quantity,
    o.total_price,
    o.order_date,
    o.status
FROM 
    "Order" o
JOIN 
    Users u ON o.user_id = u.ID
JOIN 
    OrderDetail od ON o.order_id = od.order_id
JOIN 
    ProductDetail pd ON od.product_detail_id = pd.id
JOIN 
    Product p ON pd.product_id = p.product_id
ORDER BY 
    o.order_id;
