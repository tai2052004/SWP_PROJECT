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
    discount_name VARCHAR(20) NOT NULL,            -- Loại giảm giá: Percentage hoặc Fixed
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
    create_time datetime,         -- Thời gian tạo đơn hàng
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
    image_urls TEXT  -- Lưu nhiều URL hình ảnh
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
    product_id int,     -- ID của sản phẩm
    quantity int,               -- Số lượng của sản phẩm này trong đơn hàng
    price float,                -- Giá tại thời điểm đặt (để không bị thay đổi khi giá gốc của sản phẩm thay đổi)
    foreign key (order_id) references "Order"(order_id),
    foreign key (product_id) references Product(product_id)
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
    price FLOAT,                                  -- Giá tại thời điểm thêm vào giỏ hàng
    FOREIGN KEY (cart_id) REFERENCES ShoppingCart(cart_id),  -- Liên kết với bảng ShoppingCart
    FOREIGN KEY (product_id) REFERENCES Product(product_id)   -- Liên kết với bảng Product
);
CREATE TABLE Payment (
	payment_id int identity(1,1) primary key,
	payment_method varchar(20),
	amount float
);
