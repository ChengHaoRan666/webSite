use ssm;

drop table carts;

drop table orders;

drop table reviews;

drop table sellers;

drop table stars;

drop table products;

drop table categories;

drop table users;


# 用户表
CREATE TABLE Users
(
    UserID           INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户id，主键，自增',
    Username         VARCHAR(255) NOT NULL COMMENT '用户名，不能为空',
    Password         VARCHAR(255) NOT NULL COMMENT '用户密码，不能为空',
    Email            VARCHAR(255) NOT NULL COMMENT '用户电子邮件地址，可以为空',
    PhoneNumber      VARCHAR(20)  NOT NULL COMMENT '用户手机号码，不能为空',
    RegistrationDate DATETIME     NOT NULL COMMENT '用户注册日期，不能为空',
    LastLoginDate    DATETIME COMMENT '用户最后登录日期，可以为空'
);

# 商家表
CREATE TABLE Sellers
(
    SellerID    INT PRIMARY KEY AUTO_INCREMENT COMMENT '商家ID，主键，自增',
    SellerName  VARCHAR(255) NOT NULL COMMENT '商家名称',
    Password    VARCHAR(255) NOT NULL COMMENT '商家密码',
    Description TEXT COMMENT '商家描述',
    Email       VARCHAR(255) COMMENT '商家电子邮件地址，可以为空',
    PhoneNumber VARCHAR(20)  NOT NULL COMMENT '商家手机号码，不能为空'
);


# 商品分类表
CREATE TABLE Categories
(
    CategoryID   INT PRIMARY KEY AUTO_INCREMENT COMMENT '分类ID，主键，自增',
    CategoryName VARCHAR(255) NOT NULL COMMENT '分类名称'
);

# 商品表
CREATE TABLE Products
(
    ProductID      INT PRIMARY KEY AUTO_INCREMENT COMMENT '商品id，主键，自增',
    ProductName    VARCHAR(255)         NOT NULL COMMENT '商品名称',
    ProductStoreID INT                  NOT NULL COMMENT '商家id',
    Description    TEXT COMMENT '商品描述',
    Price          DECIMAL(10, 2)       NOT NULL COMMENT '价格',
    StockQuantity  INT                  NOT NULL COMMENT '库存数量',
    CategoryID     INT COMMENT '商品分类id',
    ImageURL       VARCHAR(2550) COMMENT '图片url',
    ListedDate     DATE COMMENT '上架日期',
    Status         ENUM ('0', '1', '2') NOT NULL COMMENT '状态：特价，现售，预售'
);


# 订单表
CREATE TABLE Orders
(
    OrderID         INT PRIMARY KEY AUTO_INCREMENT COMMENT '订单ID，主键，自增',
    UserID          INT                       NOT NULL COMMENT '用户ID',
    ProductID       INT                       NOT NULL COMMENT '商品ID',
    SellerID        INT                       NOT NULL COMMENT '商家ID',
    TotalAmount     DECIMAL(10, 2)            NOT NULL COMMENT '订单总金额',
    DeliveryAddress VARCHAR(255)              NOT NULL COMMENT '送达地址',
    RecipientName   VARCHAR(255)              NOT NULL COMMENT '收件人姓名',
    RecipientPhone  VARCHAR(20)               NOT NULL COMMENT '收件人电话',
    OrderStatus     ENUM ('0', '1', '2', '3') NOT NULL COMMENT '订单状态：待处理，已支付，已发货，已收货',
    OrderDate       DATETIME                  NOT NULL COMMENT '下单时间',
    PaymentDate     DATETIME COMMENT '支付时间',
    ShippingDate    DATETIME COMMENT '发货时间',
    DeliveryDate    DATETIME COMMENT '收货时间'
);


update Orders set
    OrderStatus = '2'
where OrderID = 1;


# 评价表
CREATE TABLE Reviews
(
    ReviewID   INT PRIMARY KEY AUTO_INCREMENT COMMENT '评价ID，主键，自增',
    ProductID  INT      NOT NULL COMMENT '商品ID',
    UserID     INT      NOT NULL COMMENT '用户ID',
    Rating     INT      NOT NULL COMMENT '评分',
    Comment    TEXT COMMENT '评论内容',
    ReviewTime DATETIME NOT NULL COMMENT '评论时间'
);


# 购物车表
CREATE TABLE Carts
(
    CartID    INT PRIMARY KEY AUTO_INCREMENT COMMENT '购物车ID，主键，自增',
    UserID    INT NOT NULL COMMENT '用户ID',
    ProductID INT NOT NULL COMMENT '商品ID',
    Quantity  INT NOT NULL COMMENT '商品数量'
);


# 收藏表
CREATE TABLE stars
(
    StarID    INT PRIMARY KEY AUTO_INCREMENT COMMENT '收藏ID，主键，自增',
    UserID    INT NOT NULL COMMENT '用户ID',
    ProductID INT NOT NULL COMMENT '商品ID',
    Quantity  INT NOT NULL COMMENT '商品数量'
);



insert into Categories (CategoryName)
values ('电脑'),
       ('手机'),
       ('相机'),
       ('配件');


insert into Products
values (null, '1', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '2', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '3', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '4', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '5', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '6', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '7', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '8', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '9', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '10', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '11', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '12', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '13', 1, '描述1', 19.9, 100, 1, 'url1', null, '1'),
       (null, '14', 1, '描述1', 119.9, 100, 1, 'url1', null, '1'),
       (null, '15', 1, '描述1', 119.9, 100, 1, 'url1', null, '1'),
       (null, '16', 1, '描述1', 119.9, 100, 1, 'url1', null, '1'),
       (null, '17', 1, '描述1', 119.9, 100, 1, 'url1', null, '1'),
       (null, '18', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '19', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '20', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '21', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '22', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '23', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '24', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '25', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '26', 1, '描述1', 19.9, 100, 2, 'url1', null, '1'),
       (null, '27', 1, '描述1', 19.9, 100, 2, 'url1', null, '1');
