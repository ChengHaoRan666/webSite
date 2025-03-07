create database if not exists website;

# 创建表，添加一个用户，添加商品类别
use website;

drop table if exists carts;

drop table if exists orders;

drop table if exists reviews;

drop table if exists sellers;

drop table if exists stars;

drop table if exists products;

drop table if exists categories;

drop table if exists users;


# 用户表
CREATE TABLE Users
(
    UserID           INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户id，主键，自增',
    Username         VARCHAR(255) NOT NULL COMMENT '用户名，不能为空',
    Password         VARCHAR(255) NOT NULL COMMENT '用户密码，不能为空',
    Email            VARCHAR(255) NOT NULL COMMENT '用户电子邮件地址，不能为空',
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
    ImageURL       Text(25500) COMMENT '图片url', # 前四张是图片展示，后面是介绍
    ListedDate     DATE COMMENT '上架日期',
    Status         ENUM ('0', '1', '2') NOT NULL COMMENT '状态：特价，现售，预售'
);


# 订单表
CREATE TABLE Orders
(
    OrderID         INT PRIMARY KEY AUTO_INCREMENT COMMENT '订单ID，主键，自增',
    UserID          INT                           NOT NULL COMMENT '用户ID',
    ProductID       INT                           NOT NULL COMMENT '商品ID',
    SellerID        INT                           NOT NULL COMMENT '商家ID',
    Quantity        INT                           NOT NULL COMMENT '商品数量',
    TotalAmount     DECIMAL(10, 2)                NOT NULL COMMENT '订单总金额',
    DeliveryAddress VARCHAR(255)                  NOT NULL COMMENT '送达地址',
    RecipientName   VARCHAR(255)                  NOT NULL COMMENT '收件人姓名',
    RecipientPhone  VARCHAR(20)                   NOT NULL COMMENT '收件人电话',
    notes           VARCHAR(255) COMMENT '备注',
    OrderStatus     ENUM ('0', '1', '2', '3','4') NOT NULL COMMENT '订单状态：待支付，已支付，已发货，已收货,已评价',
    OrderDate       DATETIME                      NOT NULL COMMENT '下单时间',
    PaymentDate     DATETIME COMMENT '支付时间',
    ShippingDate    DATETIME COMMENT '发货时间',
    DeliveryDate    DATETIME COMMENT '收货时间'
);


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


INSERT INTO users VALUE (null, 'name', '1', '1', '12345678901', '2024-12-07 15:26:26', '2024-12-07 18:58:06');


# 添加商品
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('神州游戏笔记本电脑', 1, 'main={硬盘容量,内存容量};硬盘容量={512GB,1TB,2TB};内存容量={16GB,32GB,64GB}', 19.90,
        100, 1, 'https://gw.alicdn.com/imgextrga/i2/1078709264/O1CN01dQVK4D2IIy7VaThCW_!!1078709264.jpg;
https://gw.alicdn.com/imgextra/i3/1078709264/O1CN017FG9fI2IIxtBv6Qg0_!!1078709264.jpg;
https://gw.alicdn.com/imgextra/i2/1078709264/O1CN01RKdB8T2IIxtOaKA0n_!!1078709264.jpg;
https://gw.alicdn.com/imgextra/i2/1078709264/O1CN016iKDjx2IIy72mXXXL_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i2/1078709264/O1CN01NmkhAV2IIy8jC9pEI_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i3/1078709264/O1CN01shnUbX2IIy9MjoSml_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i1/1078709264/O1CN01bWE0t22IIy6kPEXvk_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i4/1078709264/O1CN01bP4Q1s2IIxz2qnsCW_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i4/1078709264/O1CN01xwmv6M2IIy5GY4Q70_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i2/1078709264/O1CN015V0pJD2IIy5Ej4bdN_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i3/1078709264/O1CN01VqpglC2IIy5DIxKxm_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01Z0lXvV1yb1HKfnl8N_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01ELQbtM1yb1HF6RhCp_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01RjgcSI1yb1HAe7Cd2_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01bwPzKx1yb1HFJsIZ0_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01rf3YB91yb1HJRPx9K_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01vu4DJg1yb1HHN7CNi_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01bdYsih1yb1HH9iLRv_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01z5glHa1yb1HJT6cZW_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01gJZuSj1yb1HRJQaRV_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01QobwNN1yb1HLG7Ny1_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01vuCe7F1yb1HMQfzjz_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01i76DYg1yb1HKtRRzV_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01K19JTm1yb1HLG9X2B_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01W4vFpo1yb1HQTRKXq_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01sCMoYx1yb1HFJtdk3_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01NXY7PZ1yb1HKfnxcL_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01igWgKQ1yb1HPKurfx_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01orPjtq1yb1HMQeaQK_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01A4DTuW1yb1HPKvT3h_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01PauKNT1yb1HJROwju_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01QM1oV51yb1HHN7jgE_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01AOKGkI1yb1HOnD26f_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01VGyFVy1yb1HR5wIHx_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01mYUlaJ1yb1HN9NN4V_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01EIBalJ1yb1HJROTd9_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01J3EpQP1yb1HH9hftF_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01lsRl2i1yb1HH9j9N2_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01ReBzuA1yb1HMQe3AS_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01ezQdlE1yb1HJT6cXP_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01toyZ8z1yb1HKtOpqK_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01toyZ8z1yb1HKtOpqK_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01kJjNqS1yb1HGPAyM1_!!2201257266596.jpg;', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('小米Redmi Book', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={银白色,黑耀色};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01X3Sv3W29zGBilbmJo_!!4611686018427381002-0-item_pic.jpg_.webp;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01zFlOWl29zG6PFaQPh_!!1714128138.jpg_.webp;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01gJEaGz29zG8DRsMTA_!!1714128138.jpg_.webp;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01yj7hfC29zG81AvLtU_!!1714128138.jpg_.webp;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01VdKR4N29zGA4boi6T_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01zrda5b29zG6MeCpZY_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01jmsbKN29zG5teeX7n_!!1714128138.jpg;
        ', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('富士xs20相机', 1,
        'main={机身颜色,存储容量};机身颜色={复古绿,咖啡色,芭蕾粉,经典黑};存储容量={16GB,32GB,64GB,128GB}', 19.90, 100,
        3, '
https://gw.alicdn.com/imgextra/O1CN01WAqjPm23AykSKmn0m_!!0-item_pic.jpg;
https://gw.alicdn.com/imgextra/O1CN01N8hta223AyioZXhtC_!!305557216.jpg;
https://gw.alicdn.com/imgextra/O1CN01vBerCq23AyiqiWM4r_!!305557216.jpg;
https://gw.alicdn.com/imgextra/O1CN01IA0uwG23Ayj1uGaeD_!!305557216.jpg;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01DxNQ0B23Ayitp5Ox3_!!305557216.jpg;
https://img.alicdn.com/imgextra/i2/305557216/O1CN01qpYs1j23AyivftGwO_!!305557216.jpg;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01GPJoVO23Az0YceFV3_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN019kl1wf23Az0aZDA4N_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01o4nhS723Ayj1Bmm3g_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01JJPoa723AyivMBl12_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01Z573iP23Az0ZddoxL_!!305557216.png;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01TECxCo23Az0Ybh2Fx_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01QZj9q423Az0aZBklC_!!305557216.png;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01JbJPU523Az0b5wuCA_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01Bgs1VH23Az0ZE8KQK_!!305557216.png;
https://img.alicdn.com/imgextra/i2/305557216/O1CN01UbG9jL23Az0ViUUN0_!!305557216.png;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01O6LjeQ23Az0WmzcNn_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01uF5VSn23AyrKzQON2_!!305557216.jpg;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01N4Bkov23Az0ZdectD_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01uF5VSn23AyrKzQON2_!!305557216.jpg;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01afbhxR23Az0bdGyKU_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01tGccf223Az0YcPMEK_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01VT2zB523AyiyLROG5_!!305557216.jpg;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01HMkWGf23Az0Y4AUaZ_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01f999RG23Az0Y47sQG_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01YQgZ1w23AyizTPPsQ_!!305557216.jpg;
https://img.alicdn.com/imgextra/i2/305557216/O1CN01E4YKLh23AyizTP9EC_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01GlfGnW23Ayj0BkN90_!!305557216.jpg;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01nRf3Gs23AyitrLFNR_!!305557216.jpg;
https://img.alicdn.com/imgextra/i2/305557216/O1CN01hZmMON23AyiuQvM2N_!!305557216.jpg;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01W0vsXG23AyivMB1Ie_!!305557216.jpg;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01NeeJUD23Ayir5BTOw_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01sUuEwi23Az0ZEAPLN_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01gpQVBT23Az0Y49gkU_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01W5bLBX23Az0WTuZg3_!!305557216.png;
https://img.alicdn.com/imgextra/i2/305557216/O1CN013O7x3823Az0bdJO2d_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN019hCu2S23Az0aNIwsw_!!305557216.png;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01mlXhsd23Az0Y49caj_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01y2mFFA23Az0aZE6LI_!!305557216.png;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01nzoJE023Az0bdJFjh_!!305557216.png;
https://img.alicdn.com/imgextra/i2/305557216/O1CN01DuNswi23Az0aZC9l7_!!305557216.png;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01YB7ezn23Az0ViXdrI_!!305557216.png;
https://img.alicdn.com/imgextra/i1/305557216/O1CN01nnycpN23Az0Xz0Kd7_!!305557216.jpg;
https://img.alicdn.com/imgextra/i4/305557216/O1CN01KeptZh23Ayj1uieat_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01tepHuo23Az0WUrFck_!!305557216.jpg;
https://img.alicdn.com/imgextra/i3/305557216/O1CN01tepHuo23Az0WUrFck_!!305557216.jpg;
https://img.alicdn.com/imgextra/i2/305557216/O1CN015EFYcv23AyitrLVzm_!!305557216.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('高清数码相机ccd', 1, 'main={机身颜色,存储容量};机身颜色={白色,黑色,粉色};存储容量={16GB,32GB,64GB,128GB}',
        19.90, 100, 3, '
https://gw.alicdn.com/imgextra/O1CN01EYYM0p2LY22Tkkx3c_!!3937219703-0-C2M.jpg;
https://gw.alicdn.com/imgextra/O1CN01P5HvnS2LY22SGl3wv_!!3937219703-0-C2M.jpg;
https://gw.alicdn.com/imgextra/O1CN01P2vOnp2LY22TP0Hbd_!!3937219703-0-C2M.jpg;
https://gw.alicdn.com/imgextra/O1CN01AgPKd82LY22R8m5gK_!!3937219703-0-C2M.jpg;
https://img.alicdn.com/imgextra/i1/2218676375474/O1CN01yEZLNg1qJ94mLuvRb_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i1/2218676375474/O1CN01CGMyJr1qJ94mZKrKC_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i4/2218676375474/O1CN01ANFfo41qJ94qVUIXs_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i2/2218676375474/O1CN01wZ53xW1qJ94mLvOXo_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN01tchHiM1qJ94qycDIc_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i4/2218676375474/O1CN01O4W6PO1qJ94noW4Xw_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN012CjfF81qJ94qVVdhn_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i1/2218676375474/O1CN01fC8LPY1qJ94hITOd9_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN01tNwXng1qJ94oPtsfM_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i4/2218676375474/O1CN017dYzOR1qJ94pA2VKk_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN01byGRsb1qJ94qya04X_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN01CG4aLj1qJ94pBCTHc_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i4/2218676375474/O1CN01yiLOv11qJ94nhGXkT_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i1/2218676375474/O1CN018FBbVc1qJ94oFbJSL_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN01DBFGSv1qJ94psAREZ_!!2218676375474-0-scmitem176000.jpeg;
https://img.alicdn.com/imgextra/i3/2218676375474/O1CN01prTosQ1qJ94pA1hRZ_!!2218676375474-0-scmitem176000.jpeg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('迪士尼联名 松典学生微单数码相机', 1,
        'main={机身颜色,存储容量};机身颜色={米妮粉,米妮白};存储容量={16GB,32GB,64GB,128GB}', 19.90, 100, 3, '
https://gw.alicdn.com/imgextra/O1CN01fZVEoh1Ncj9HigFiu_!!2209653741591.jpg;
https://gw.alicdn.com/imgextra/O1CN01QvBC3g1Ncj9LybQw8_!!2209653741591.jpg;
https://gw.alicdn.com/imgextra/O1CN01Qf6Dsu1Ncj9LyalJC_!!2209653741591.jpg;
https://gw.alicdn.com/imgextra/O1CN01fZVEoh1Ncj9HigFiu_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN012Fnq6V1Ncj9HwZrBU_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01BT833K1Ncj9MTIUlG_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01Co2OwQ1Ncj9LRerji_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01XSm26c1Ncj9KdUNwU_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01vutoF31Ncj9Lygrtd_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01Xb0Hix1Ncj9KdSNE8_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01zllhEc1Ncj9JgJXsH_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN01VkG2M41Ncj9Jaf2Xm_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN015s99BA1Ncj9HwY79b_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01a2qxni1Ncj9JDGzV4_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN01syvBT71Ncj9H0X2l9_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01TBApsb1Ncj9KGhfb9_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01F6WiL91Ncj9JgL9g0_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01EgmIVU1Ncj9KGjHPb_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01jW5Mjp1Ncj9J757UF_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01h5hXRT1Ncj9MTL73q_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01Ju2lvh1Ncj9H0XRkf_!!2209653741591.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('松典高像素高清dv摄像机', 1, 'main={机身颜色,存储容量};机身颜色={黑色,白色};存储容量={16GB,32GB,64GB,128GB}',
        19.90, 100, 3, '
https://gw.alicdn.com/imgextra/O1CN018UUHCd1Ncj6ahaCXN_!!2209653741591.jpg;
https://gw.alicdn.com/imgextra/O1CN018UUHCd1Ncj6ahaCXN_!!2209653741591.jpg;
https://gw.alicdn.com/imgextra/O1CN01zko1Sw1Ncj6fQM2Ji_!!2209653741591.jpg;
https://gw.alicdn.com/imgextra/O1CN01qmP4A81Ncj6e6EovY_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01dbKeFO1Ncj6eaV4jF_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01QUFyrD1Ncj6f0wqId_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN013ACLYB1Ncj6cNWIhi_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN01YhfSEz1Ncj6eENK4o_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN01tBSDPr1Ncj6gGt7AC_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01KLyDcg1Ncj6csXtZQ_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01vvCOOo1Ncj6iRm7o9_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01tr5GWJ1Ncj6idI6Vc_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01qXQqfV1Ncj6dNfpYa_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01Wh3shP1Ncj6hAt80r_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01cpEC5L1Ncj6dP6ywx_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN01JCi6dI1Ncj6fQY7Xb_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01fEokbN1Ncj6dlAyLE_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN01NUxoO91Ncj6dNf9xo_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01tWteml1Ncj6dNh2Op_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN0130hmGy1Ncj6dNfYwK_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01VhCjP61Ncj6hAt82U_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01s9s6CA1Ncj6hzXL25_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN01LBbmw61Ncj6eENODn_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN01BDGVgW1Ncj6buQGks_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i2/2209653741591/O1CN013O8cE21Ncj6bYrYGX_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i3/2209653741591/O1CN01zfgYDw1Ncj6Wzx940_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i1/2209653741591/O1CN019lFFQ91Ncj6gFKeVa_!!2209653741591.jpg;
https://img.alicdn.com/imgextra/i4/2209653741591/O1CN017Ffhhv1Ncj6gUPmGr_!!2209653741591.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('aigo爱国者E6数码相机', 1, 'main={机身颜色,存储容量};机身颜色={黑色,白色,粉色};存储容量={16GB,32GB,64GB,128GB}',
        19.90, 100, 3, '
https://gw.alicdn.com/imgextra/O1CNA1CSUy2U1nSMC8XjVTE_!!2217700535088-0-psf.jpg;
https://gw.alicdn.com/imgextra/O1CN01eNyXxx1nSMB9hYhBW_!!2217700535088.jpg;
https://gw.alicdn.com/imgextra/O1CN01HQcwGZ1nSMB9Qi4dr_!!2217700535088.jpg;
https://gw.alicdn.com/imgextra/O1CN01a0mDFF1nSMB9hYIFX_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01YlOwQD1nSMBCtWAPc_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i3/2217700535088/O1CN01kexJPU1nSMBCMJYWq_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01lCV6gL1nSM9pznFTx_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i3/2217700535088/O1CN01cTUaud1nSMBBQVqVE_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01us1Y201nSMB8G9jN5_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN015Z84a51nSMBB0TOCp_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN01CFNyYU1nSMB7U9Wik_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN01Qy354S1nSMBB0RFAT_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01oHq1qB1nSMB9qEZXk_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN01ggxixg1nSMBAPFZTk_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01ut8Ja11nSMB8YGtHd_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN018wzSrK1nSMBB0SqvG_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01FVYSRw1nSMBB0RukU_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN010TUguq1nSMB7UAw3M_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i3/2217700535088/O1CN01rc45vk1nSMBALFNig_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN01QOjNqC1nSMB7UB8Vu_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i3/2217700535088/O1CN01vvP5NE1nSMB7UC0aC_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i3/2217700535088/O1CN01LPXXOi1nSMB7UBsHb_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01abZK781nSMB8GBoH0_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01OAAlrW1nSMB8YEXkc_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01jgWPxE1nSMBBOoiBu_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01TSUwEU1nSMBCMJxUn_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN01oeYxSE1nSMB7UBKzz_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01FC81Xk1nSMBDQtzYI_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01dvjZq21nSMB36uxlp_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN01JizO5t1nSM9ENhiJ1_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01TVtWUJ1nSMBFZzAUf_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i2/2217700535088/O1CN01lDYbtT1nSMBFV15gy_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i4/2217700535088/O1CN0155fc6R1nSMBH96sE2_!!2217700535088.jpg;
https://img.alicdn.com/imgextra/i1/2217700535088/O1CN016RXWwD1nSMBEJyneG_!!2217700535088.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('Sony/索尼 Alpha 7 IV A7M4相机', 1,
        'main={机身颜色,存储容量};机身颜色={黑色,白色,粉色};存储容量={16GB,32GB,64GB,128GB}', 19.90, 100, 3, '
https://gw.alicdn.com/imgextra/i4/782731205/O1CN014vZS6x1KlwEYtsMFJ_!!782731205.jpg;
https://gw.alicdn.com/imgextra/i3/782731205/O1CN011mVaDs1KlvyXMXNrI_!!782731205.jpg;
https://gw.alicdn.com/imgextra/i3/782731205/O1CN01s8hHPt1KlvyflL6fJ_!!782731205.jpg;
https://gw.alicdn.com/imgextra/i1/782731205/O1CN01zozheJ1KlvydG35GT_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01U0pYbE1KlwBdiHmPv_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01SpZto41KlwBaQTWrB_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01l04JNN1KlwBfxzXgL_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01SHQ27x1KlwBeZ8LZw_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN01cCJ4Ox1KlwBfTXNsh_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01Ph2XRb1KlwBeTaYQo_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01AXtPx41KlwBh48vDx_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01Mbh9Jj1KlwBVrWVbu_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01LOmIU51KlwBfTWZyc_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01JiRXKl1KlwBVrXJV5_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN016EOeko1KlwBiCy7k2_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01OENDEs1KlwBVrUlVg_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01CFdScl1KlwBVrUtqJ_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN01N3AgEj1KlwBeZ7bsR_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN015Cr7Mt1KlwBh4BP6M_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01bDkN6d1KlwBircHXO_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01rSkwfn1KlwBdiHmQJ_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01xjy2161KlwBiD14hf_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN016gbSuN1KlwBVrVMxx_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01xSGEmu1KlwBh47FGr_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01bnoH3G1KlwBdlBlDG_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01e3vE1w1KlwBhSUyrN_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01ongMB31KlwBgBJR0W_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01H9tH1l1KlwBVrV6Jz_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01toEouj1KlwBiCy7k5_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01mk2Kc01KlwBaQT3mg_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01mk2Kc01KlwBaQT3mg_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01aVHFQw1KlwBdi9aj8_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01iePH5z1KlwBgBKm9T_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01G1crvu1KlwBfTVZbK_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN01SshdWe1KlwBgBIlRi_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01WQ6ICW1KlwBaQSWXX_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN01myOgOJ1KlwBbu3d7z_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN01q2X2ny1KlwBdi9es2_!!782731205.jpg;
https://img.alicdn.com/imgextra/i1/782731205/O1CN01Yz1BW81KlwBgBKuSh_!!782731205.jpg;
https://img.alicdn.com/imgextra/i4/782731205/O1CN01szusi31KlwBdi8ieQ_!!782731205.jpg;
https://img.alicdn.com/imgextra/i2/782731205/O1CN01NiMcK31KlwBbu4EYL_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01YgtEpP1KlwBiD14hg_!!782731205.jpg;
https://img.alicdn.com/imgextra/i3/782731205/O1CN01B3TgJ31KlwBiCz881_!!782731205.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('DJI 大疆 Osmo Action 5 Pro运动相机', 1,
        'main={机身颜色,存储容量};机身颜色={黑色,白色,粉色};存储容量={16GB,32GB,64GB,128GB}', 19.90, 100, 3, '
https://gw.alicdn.com/imgextra/O1CN01eDEnip1NboMMq3xRn_!!2215962421589-0-yinheaigc.jpg;
https://gw.alicdn.com/imgextra/O1CN0179Xl2h1NboMPiF1Bg_!!2215962421589.jpg;
https://gw.alicdn.com/imgextra/O1CN01dZt9em1NboMOEyZuJ_!!2215962421589.jpg;
https://gw.alicdn.com/imgextra/O1CN01a5ydaO1NboMIVHyQ4_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN016Nt2k41NboMTMSgeT_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01CvLXqc1NboMcVh14r_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN017pHOfB1NboMaALgFz_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01GgLYuH1NboMLLLFl3_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01pNzvui1NboMTMVATg_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01y3gMKG1NboMaTerrq_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01jEv3zt1NboMJGUdzX_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01vTHM5U1NboMNd0fkB_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01Skuxqn1NboMbt1qD4_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN01Ulagu51NboMbwv3aq_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01v651GZ1NboMNcyrUT_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN019DUYTl1NboLBLjkoR_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01fLrjgf1NboMczJx2W_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN01vpKEoD1NboMYcsky2_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN01UQjgmD1NboMTMSknD_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN017KG6Lo1NboMZsRjQr_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01kMTPn41NboMZk2qEh_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN01NG07H51NboMbws6fF_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01KAzVzB1NboMDydsR7_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01yInfEO1NboLDJsfEC_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01pNcOnB1NboMbszxke_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN011LmwAE1NboMTMTh14_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01UbAyKl1NboMaAnfq2_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN019iYGqd1NboMTMVMy3_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01YLGxbj1NboMYPS9P5_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN01B8rpL61NboMbDKkqE_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01IdQp0P1NboMbDIbmB_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01oprqmv1NboLAgnmaL_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01PsWzED1NboMaAn8ZJ_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01JXO6Oa1NboMbDHnrT_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01E8k4Vm1NboMczL1Wz_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01c69qvo1NboMaAoLQN_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01qAG1NP1NboMaqO6kw_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN013oWcbo1NboMbt37C9_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01FF0fA11NboMaTcr5R_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01J9ydmD1NboMZsRKVh_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i2/2215962421589/O1CN01Zfuaoe1NboMcVj5yV_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i3/2215962421589/O1CN01Det8vO1NboMczKYSf_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i4/2215962421589/O1CN01FJJiZh1NboMaApPxO_!!2215962421589.jpg;
https://img.alicdn.com/imgextra/i1/2215962421589/O1CN01e3sgJ11NboMXi5x9X_!!2215962421589.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('影石Insta360 Ace Pro运动相机', 1,
        'main={机身颜色,存储容量};机身颜色={黑色,白色,粉色};存储容量={16GB,32GB,64GB,128GB}', 19.90, 100, 3, '
https://gw.alicdn.com/imgextra/i1/2208654990728/O1CN019Fu5i01HFTKl4aQcO_!!2208654990728.jpg;
https://gw.alicdn.com/imgextra/i4/2208654990728/O1CN014k8qkf1HFTL1NcYjd_!!2208654990728.jpg;
https://gw.alicdn.com/imgextra/i3/2208654990728/O1CN01yjue911HFTL0JmAiN_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01UhYY1h1HFTL3zbjMi_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01AWz0391HFTKo5NM9M_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01dIvXng1HFTL0Jd2iZ_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01BdMtdT1HFTLAetPyl_!!2208654990728.png;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN01Yynd4H1HFTLBGKSz5_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN019BBlyM1HFTLAk9oeB_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN01K7XgVT1HFTLAaNL3J_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN017qnIat1HFTLD05Z00_!!2208654990728.png;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN012t4b1m1HFTLCLvwbR_!!2208654990728.png;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN01NvCPWo1HFTLAADQdN_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01mYnr821HFTL7uBFzb_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN016HQsBv1HFTLAALYKD_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01Xrbugh1HFTL8szOqy_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01Ru1G6v1HFTL8dedUL_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01QSXWn21HFTLCVpQE3_!!2208654990728.png;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01cOPVTo1HFTLAaX0V0_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN01HHk9ql1HFTLCVy5Ag_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01s7Jvvl1HFTLAaWwL4_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN017iqYfK1HFTLDXrM0L_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN01xGSPEg1HFTLAAFydf_!!2208654990728.png;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01YGhq8g1HFTLBcfNlG_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01NpGBbL1HFTLCLwHPm_!!2208654990728.png;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01sRjKdl1HFTLBGDoqM_!!2208654990728.png;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01tFh5Q31HFTLAetgeo_!!2208654990728.png;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01lCI2Ye1HFTLDXjAFP_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01otcur71HFTLDXj65p_!!2208654990728.png;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01Te9j2A1HFTLAk4RYT_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01YbaH2b1HFTLDXkRFM_!!2208654990728.png;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN0164tvab1HFTL3XwGCJ_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01xPjoix1HFTLAAMh1M_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01mM35Lh1HFTL8szOr0_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01R7Om6R1HFTLBdnbty_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01gpQBjb1HFTLAk52xy_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01FWvpOx1HFTLBclhGU_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01w4fVmi1HFTL8de6D6_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01iwfz5b1HFTL8dWqhW_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN01orEGYI1HFTLAAF2Uh_!!2208654990728.png;
https://img.alicdn.com/imgextra/i4/2208654990728/O1CN01lSgXAP1HFTLCVoHdO_!!2208654990728.png;
https://img.alicdn.com/imgextra/i2/2208654990728/O1CN012nX30l1HFTL8stl5p_!!2208654990728.png;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01urhkrS1HFTLAeyzZL_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i1/2208654990728/O1CN01ApUQen1HFTL8t1sjZ_!!2208654990728.jpg;
https://img.alicdn.com/imgextra/i3/2208654990728/O1CN01Bz85zQ1HFTLA33L6p_!!2208654990728.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('Leica/徕卡 D-LUX 8数码相机', 1,
        'main={机身颜色,存储容量};机身颜色={黑色,白色,粉色};存储容量={16GB,32GB,64GB,128GB}', 19.90, 100, 3, '
https://gw.alicdn.com/imgextra/i2/2874484355/O1CN013q3GTG1i2dseHBpdE_!!4611686018427381379-0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i3/2874484355/O1CN01a044851i2dpEf2NB8_!!2874484355.jpg;
https://gw.alicdn.com/imgextra/i4/2874484355/O1CN01lmwcDG1i2dpFHac5p_!!2874484355.jpg;
https://gw.alicdn.com/imgextra/i2/2874484355/O1CN01IknMUv1i2dpEf2Zf5_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01cfJmd21i2droVVMHC_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01IaRZZL1i2dqu84lIk_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01T7poDl1i2drpZru9X_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i3/2874484355/O1CN01ZHVj7x1i2dro36TtR_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN011KSt1u1i2drpZsi1u_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i1/2874484355/O1CN01NQGyu91i2drpZsyeH_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i1/2874484355/O1CN018mMycP1i2drlkenjx_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01lYB9mC1i2drmlT8hy_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01XdJaP11i2drpZs6dA_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01oy3DJA1i2drmlSnvU_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i2/2874484355/O1CN01dUWfBy1i2drrXLn8h_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i4/2874484355/O1CN01buGCL91i2drmlQakO_!!2874484355.jpg;
https://img.alicdn.com/imgextra/i3/2874484355/O1CN01t757rf1i2drr08ynd_!!2874484355.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('惠普轻薄笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={银色,粉色};硬盘容量={512G,1TB};内存容量={8GB,16GB,32GB}', 19.90,
        100, 1, '
https://img.alicdn.com/imgextra/i2/133668489/O1CN01WLSQbh2Ca1CkdquB0_!!0-item_pic.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01e6fIdu2Ca1CjuAUu6_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01kuDRX32Ca1ByioO58_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01e6fIdu2Ca1CjuAUu6_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN011ULxGP2Ca1Cea0lnY_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01FxBPUF2Ca1Cpp47rd_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Jmxbp02Ca1CqzFJZB_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01vbDGwM2Ca1CkT8k8o_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN019g7eI62Ca1CrbYbHQ_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01JWdQYp2Ca1Cr6OfGD_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01VndbLY2Ca1CWq67iK_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01T83t332Ca19YpT9Vb_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01fkbIGo2Ca1CtQCDEY_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01japPBv2Ca1CXXZ1SH_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01gYVkku2Ca1CYza7lT_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Qs7zcB2Ca1CYc9FBt_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN013BO3Ll2Ca1CYSCu2l_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01zc1SOL2Ca1CX87Yrh_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01JuOjP62Ca1CYzbX4H_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01LBZTlg2Ca1CXXKWnG_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01tfXuZp2Ca1CPHpkPS_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Vt73FI2Ca1CZWhy0r_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01uFagDD2Ca1CYHAGI2_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN018nfUJi2Ca1CXXYkpP_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01zGDS9h2Ca1CVu1ogR_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01FN8NIV2Ca1CUOuBAA_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01plBx8V2Ca1CWXjQKq_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01sHiDvg2Ca1CXXNLRh_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01XTHP5a2Ca1CVyVXwy_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01w2Mq4w2Ca1CWXiHei_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN013foOOJ2Ca1CXXMbi0_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01NLCvul2Ca1CTeAaLQ_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN0190c8xQ2Ca1CXXXLZv_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN014AvTLG2Ca1CXXKOV1_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01SzFtFa2Ca1CWXixEz_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01ZieqeU2Ca1CUj4xiM_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01Xu7TXI2Ca172gDsZO_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01S2L9pq2Ca1CYzd4hz_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01vyyb5i2Ca1CYSCZF2_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01sMYu9s2Ca164m5h8b_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN0128CLy52Ca19TJCXZE_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01eg5xnF2Ca1CaQ4fUi_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01fQ0Rgt2Ca1CYh7JgA_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01i8meU62Ca1Cb8YlCY_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01F4z9QU2Ca1CVp5OcO_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01SC1yOf2Ca1CaQ2iws_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01hOd07y2Ca1Cb8YUb1_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Iug7NE2Ca1CWseK5w_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01BW1LPO2Ca1CRSMnCI_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN017AWY2I2Ca1CWZZHGr_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01dOcb5F2Ca1CYH9ait_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01R0OzxW2Ca1CTe8N6W_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01duYDGm2Ca11Qzst6O_!!133668489.png;
https://img.alicdn.com/imgextra/i3/O1CN01MsWlBa29wVnysxUvn_!!6000000008132-2-tps-750-880.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('华硕14 2024 全新一代酷睿记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={树莓蜜粉,香草罗勒,栀子幻白};硬盘容量={512G,1TB};内存容量={16GB,32GB}',
        19.90, 100, 1, '
https://picasso.alicdn.com/imgextra/O1CNA105SXuO1bORPMLF3hR_!!686773455-0-psf.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN011xx7bu1bORMQtsywO_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01453ENU1bORMUCdNdr_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01EuyNM21bORO8N9OtT_!!686773455.jpg_.webp;
https://img.alicdn.com/imgextra/i4/686773455/O1CN0103ZMY81bORO6DeVmk_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN016nMM3L1bORMQ31Tgm_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01QchwtW1bORPGyTsSW_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN017wyqo21bORMU7pIwj_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01Kc6ASb1bORMOW2RCn_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN016omqJr1bORMSHLZnH_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01PXrh4X1bORODQ3vyn_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN011l1rBF1bOROE9XJc2_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN013Swb8f1bOROGjGKaB_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN017t1mur1bORMQMnH5k_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN013WHlg91bORMSHIUX7_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01Bnkiyy1bORMRhsFJM_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN018DBU8Z1bORMQMlb7B_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01mnfSEZ1bORMQonBWx_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01jWAgvU1bORMO8ZABR_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN019udruO1bORMRhrVZY_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01dNnJA51bORMQ33URd_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01KJcSvV1bORMTOZ15R_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01TtdvZI1bORMIfQX7N_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01CTArzW1bORKhVqTp5_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01yuU5OB1bORDZbd5k9_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01DbNLyq1bORDWPTDFX_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01ZwwJ3m1bORJULBl1A_!!686773455.jpg;
https://img.alicdn.com/imgextra/imgextra/i2/686773455/O1CN01yp3vHY1bOR9NWhb0V_!!686773455.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('联想笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={银色,灰色,黑色};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://img.alicdn.com/imgextra/i2/2955374408/O1CN013shNbq1iQurYmMIFv_!!4611686018427383624-2-item_pic.png_.webp;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01tSRn8w1iQunvAxG3N_!!2955374408.png_.webp;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01qNbIr11iQunuLusBz_!!2955374408.png_.webp;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01oOiFAj1iQunsFU6ar_!!2955374408.png_.webp;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01itQEQQ1iQufA4uLAB_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01jaTEH21iQum37G0e3_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN018jTIvR1iQuqaGMMCq_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01VeyRTf1iQufCLvf15_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN01quRPFj1iQurXPCAVQ_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01SnMGis1iQurV2UuGA_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01OhaAOR1iQurV2VqTh_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN018LNVTJ1iQurTVV7uQ_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN01uaXdfV1iQurXsbCpu_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN016eQqRy1iQurVT3rA3_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN012o3iQ31iQurUvIrxP_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01ZgTNaf1iQuf7xqzY0_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01PM4dEm1iQurXsbXdE_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01ilOUz31iQurUvIw6W_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01NEvVbY1iQurSlnNie_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01NEvVbY1iQurSlnNie_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN010d7KdR1iQur4RvYaZ_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i3/O1CN01MsWlBa29wVnysxUvn_!!6000000008132-2-tps-750-880.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('荣耀MagicBook笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={冰河银,高级灰,石墨黑};硬盘容量={512G,1TB};内存容量={16GB,32GB}',
        19.90, 100, 1, '
https://img.alicdn.com/imgextra/i2/3261336459/O1CN018qLtyt1xaHBSI1BW6_!!2-item_pic.png_q50.jpg_.webp;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01SfZ4lq1xaHBRtuz3z_!!3261336459.jpg_.webp;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01qkX70c1xaHBQwqaqr_!!3261336459.jpg_.webp;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN01bma2TE1xaHBNkyUcR_!!3261336459.jpg_.webp;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01qtDiDh1xaHBN80epH_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01bv4h8m1xaHBPzuj7Q_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01rU3KFP1xaHBPYvnEt_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN01cZZjjQ1xaHBRwTDXc_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01HMgt4o1xaHBQhmoaR_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01jU14QK1xaH0U40oC9_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01nOVizQ1xaH0ayP92Q_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01Hpvang1xaH0ayPkVG_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01fzTvsZ1xaH0Wl5qvS_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01YfbqbK1xaH0Klgz6e_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01RSwhmH1xaH0QoSXDg_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01lEHt8R1xaH0Kli7nt_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01bQRNID1xaH0U41oZe_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01G7hZay1xaH0boZDCh_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01O7EUwh1xaH0ZEC87Y_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01VKOjsx1xaH0RYFzEk_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01JKkujd1xaH0RYGzdq_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN018aRzIO1xaH0VaPvQn_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN014Wwz2x1xaH0PT260u_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01ZORamg1xaH0U42cRp_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01OuAHVd1xaH0TduWXT_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN01IWsST51xaH0ayRMJh_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01cAWl9x1xaH0VaO2zD_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN013ytMgS1xaH0RYGj1u_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN010Q3iYW1xaH0ThRBfY_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN013MRBex1xaH0RYJk9q_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01C3duTg1xaH0TdycZS_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01ftrk6u1xaH0ZthOca_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN012bbXgG1xaH0Tdy5J9_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01zz6L491xaH0RYHGIt_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01B5dlt11xaH0ayQYOd_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01LoCgnd1xaH0XWsdEd_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01hPc9QV1xaH0RYI4Cz_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01mVnuxb1xaH0RYHGJ6_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01H70pMm1xaH0boWzzC_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01J5Ynew1xaH0ZECfOP_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN013CEg8p1xaH0QoSs22_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/O1CN01MsWlBa29wVnysxUvn_!!6000000008132-2-tps-750-880.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('华硕天选4 13代英特尔酷睿笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={魔幻青,日蚀灰};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://gw.alicdn.com/imgextra/O1CN01xdtsCB1bORPYtDrV9_!!686773455-0-picasso.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01ZLR64r1bOROw99kW3_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01aeFp2j1bOROtYx7RW_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01iSUUHS1bORDnJretP_!!686773455.jpg_.webp;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01mQjrGr1bORPXEAmGK_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01r5kzWN1bOROlHi84a_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01cdZzwN1bORORqHdw2_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01VOg1GK1bOROv8nOvu_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01l7Owyn1bOROu7dJ3m_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01QrG1IU1bOROxBcSsJ_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN014kpBBg1bOROryjTiC_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01NAVFHz1bOROu46MkI_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01tLtBHz1bOROsChmme_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01Ly1ONk1bOROxBbG2l_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01ILMd6x1bOROxBaedC_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01uWvCz61bOROtQVsKS_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01ZIOqPR1bOROu7fr5M_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01c6Ba9Y1bOROweanNJ_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01kh8FpG1bOROujIFLg_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01lJRBv01bOROv8p0gn_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01aTSwA71bOROr9OQxH_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01ewXzOO1bOROw6pD1V_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN019ZdIK41bOROxBaFhJ_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01epPrRN1bOROtWlRH0_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01Noes1V1bOROsCfuO6_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01aBaHUy1bOROmkDMoY_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01wh7zU11bOROujGuCG_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01zKtClM1bOROtsRCiV_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01YWV4dr1bOROvBPvWi_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01VBkBVs1bOROx68QQH_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01QlEzXk1bOROuTbngX_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01N5SSNR1bOROtyIOmG_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01RgMNvI1bOROrbHPan_!!686773455.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('十三代RazerBlade雷蛇灵刃电竞游戏笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={魔幻青,日蚀灰};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://gw.alicdn.com/imgextra/O1CN011z2mEb1tuBx1AAssn_!!1085315961-0-picasso.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01t5Vev21tuBwWOtemp_!!1085315961.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01t5Vev21tuBwWOtemp_!!1085315961.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01n9AEjh1tuBwWubQm4_!!1085315961.jpg_.webp;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01fOqbwS1tuBx7ZIQLA_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01cah0Zw1tuBwzwFgHD_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01IXQDgm1tuBwtI8BW6_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN011U7ski1tuBuGmiAfk_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01TulN681tuBmxEre60_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN013rcVHD1tuBn2veK0R_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01FtTXYU1tuBurP2ajI_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN01VT6PQw1tuBwb3ZnJ8_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01SeCtGe1tuBwgUuqeP_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01hTfoqt1tuBustqQia_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01Ex7d961tuBwgBg48c_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01BinCoi1tuBwhg4rKg_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01nke9Jk1tuBuokhWcO_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01DFIizJ1tuBwfQfQGh_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN015bfjO91tuBwkmzouF_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01v2ZZ2i1tuBn6s3JC8_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01EgHJhv1tuBwkFxLcZ_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN017ZlPK01tuBwiJYBHA_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01EVLhjz1tuBn1GngY6_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN01PUkrIt1tuBwb3ZKDp_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN01d3JnKm1tuBwjKAuU6_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01ZLZpaj1tuBwjKAuUB_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN0167MV8S1tuBwgUua01_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01bp4cuZ1tuBuuSARpX_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01F9Mj0y1tuBwb3ZnJB_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01XV0ygk1tuBwhg3ie3_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01B1A3Xw1tuBusttFIe_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01kqMEnc1tuBn1Go1Mo_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01zjkwBH1tuBwiFUu1x_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN012VGvFG1tuBwhl34Vs_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN010ZczeB1tuBvDXdyf2_!!1085315961.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('橘宝MEOW R15电竞游戏笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={雪影白,橘影橙};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, 'https://picasso.alicdn.com/imgextra/O1CNA1e2xmHk1Jgc2YKpo5j_!!2651871058-0-psf.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01mDsDUS1Jgbxs9EE5g_!!2651871058.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN012h3OKA1JgbxwBmkVE_!!2651871058.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01PF9S5p1JgbxxfWNSe_!!2651871058.jpg_.webp;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01BjMRmX1Jgc20kCmng_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN018FxYqy1JgbzphlMjF_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN011mOkHB1JgbzgJpguX_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01YYkV5y1JgbzFhLoE1_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01dY9WVX1JgbzKVb4Q6_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01IXYRCs1JgbxwGoJW9_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01TwNe131JgbzFyL0Lh_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01dqK01z1JgbzJr2gGQ_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01A8ROcT1JgbzJr0fWe_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01CCRMOr1Jgbz8I96e9_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01OdM3Vz1Jgbxt9bVPR_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01fz2tq41JgbzCnRPVs_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01zVCPMU1JgbzKVckKQ_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01AlS2041Jgc01zYkJm_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01BC6BbN1Jgbxyl56KV_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01kZiJge1JgbzJ6YnZ3_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01STD2qy1JgbzHy7u4H_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01ZghZY11JgbzGTIb09_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01pOBt4S1JgbzHprvlC_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01w4s8PP1Jgby0Ykoop_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01cObAfF1JgbzE9072m_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01Zy6kPV1JgbzCnOvfl_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01CteVOc1JgbxvQHt0u_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01tjDpsb1JgbxzuZeqv_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01dBvwmN1JgbzjrjVDr_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01WYUzzF1JgbziFAv9x_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01UsQTni1JgbzkJiaxS_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01p8AsOu1JgbzmFBoeh_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01DQLfyI1JgbzfSY4VW_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01vQF4iK1JgbzkQCSly_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01K0l3QI1JgbzkQ9Vmo_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01buNa2B1JgbzjrY5Y8_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN012mPen21JgbzgLmneC_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01XpOI1z1Jgbzia5D3p_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01zMIfsb1JgbzjrZEDv_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01bW5FdF1JgbzjrXov9_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN019flALy1Jgbzia4PAB_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN0164QFjd1JgbzlVMsrB_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN010nsAS71Jgbzia60xW_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01xWhFR11JgbzlVLLGQ_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01Jiymne1JgbzfSKNJA_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01taIxVL1Jgc0fGOqGp_!!2651871058.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('Apple MacBook air', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={深空灰,银色,午夜色,星光色};硬盘容量={256G,512G};内存容量={8GB,16GB}',
        19.90, 100, 1, '
https://gw.alicdn.com/imgextra/O1CN01KbAPcP1idjvlQFPhM_!!2200877014436.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01RYtSSB1idjvjV5zfA_!!2200877014436.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01bZgdBX1idjvkdT0VD_!!2200877014436.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01Ffyf0K1idjvlQFTvU_!!2200877014436.jpg_.webp;
https://img.alicdn.com/imgextra/i1/2217102796746/O1CN01yQ9UWn1zhiqHi3ZzS_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i1/2217102796746/O1CN01UuJudr1zhiq5gM1lV_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i3/2217102796746/O1CN01e8rJuj1zhiq3oHbJp_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i4/2217102796746/O1CN01TGb46e1zhipwoSnaP_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i2/2217102796746/O1CN01P0E9u51zhiq5ZXPc1_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i4/2217102796746/O1CN014LH0tR1zhiq6edXdY_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i1/2217102796746/O1CN01iz6Nw21zhiq4U64Wa_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i4/2217102796746/O1CN01W6V6aQ1zhiq3hxfqs_!!2217102796746-0-scmitem1000.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('vivoiQOO13新品骁龙8至尊版', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={赛道版,传奇版,纳多灰};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/O1CN01XMz1sC23opTxkvfQO_!!883737303-0-picasso.jpg;
https://gw.alicdn.com/imgextra/O1CN018eY9fH23opTLboFQX_!!883737303.jpg;
https://gw.alicdn.com/imgextra/O1CN01XGIqgc23opTNdIoG2_!!883737303.jpg;
https://gw.alicdn.com/imgextra/O1CN01CNRstt23opTLbl62F_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01QNFmRr23opTNg811j_!!883737303.png;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01ngLx1W23opTMehYmd_!!883737303.png;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01z6MPb923opTqWNIkb_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01N8KKIv23opTo2vzvm_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01tFoE3n23opTqfBhro_!!883737303.png;
https://img.alicdn.com/imgextra/i2/883737303/O1CN017uygVg23opTQAUn4d_!!883737303.png;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01iUD5DF23opTP7RZDh_!!883737303.png;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01mfdOv723opTQzFezW_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01tFeM8323opTgZ91vq_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN013TG6Ex23opTOV4yNE_!!883737303.png;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01KtqHwY23opTRYJqx0_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01fzZ1qx23opTrAcF1z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01K0XwN323opTpUvyFy_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01SxtJ6b23opTp4R6gZ_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01Jxp6cu23opTon6IqP_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01dlvHN823opTon7AuU_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN011vqXAu23opTpqFBBG_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01Fy0RI123opTqYMmTn_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01ILhAXF23opTpUuYwX_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01qpWRr123opTQ8Dchm_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01RnMbiB23opTon9FnT_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01U8DqXN23opTouHCI4_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01lKe3Nb23opToLwQeo_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01DJ1meK23opTp4Sz7Z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01IKxfiV23opTpqCtqa_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01YpH29t23opTmzZIjg_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01UrPRgh23opTMjw9Y8_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01ojoMU523opTp4TvLx_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01x7bSCl23opTmzXgve_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01l0jgjV23opTqcDqkD_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN011eAG1e23opThvs89a_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01Bfcpvr23opTqYOj3U_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN018qev1K23opTouHKZC_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01T0OmiJ23opTMjy20z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01bfT8WB23opTmHFtPC_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN013zFq5n23opTNF073Z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN016fxdRm23opTon8Rub_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01iJnehM23opTouITDi_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01DOuFRG23opTmHGd9o_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01lnEUZE23opTouIfhk_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01Pcp3UW23opTpUuUm6_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN018GVs7U23opTpUuE91_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01jI3FIa23opToLwd80_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01o3DlN323opThvtPA8_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN0126SDRZ23opTmzYYzE_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01QfBNMh23opTon82yu_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01OKhmUz23opTppWCc8_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01oShyjB23opTpUuYwk_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01YQL9wR23opTrdudRI_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01TwKbJf23opTp4SRqn_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01fhAR1M23opTqcCyiT_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01qjYDoX23opTpUuxsk_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01t5PBsp23opTrdt5nM_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01iNl0Hb23opToLvQJC_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01WB86JF23opTsgPERX_!!883737303.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('realme真我GT2大师探索版', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={旷野,冰岛,苍岩,晨曦};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01RuPrLz1uS531WXAU9_!!2214598466035.png;
https://img.alicdn.com/imgextra/i2/2214598466035/O1CN0135I1tY1uS532Ow08y_!!2214598466035.jpg;
https://gw.alicdn.com/imgextra/i3/2214598466035/O1CN01fDUIH61uS52xjQfRG_!!2214598466035.jpg;
https://gw.alicdn.com/imgextra/i3/2214598466035/O1CN01XSlyAP1uS530KzGH3_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i2/2214598466035/O1CN01HwSVed1uS52zybzXe_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i2/2214598466035/O1CN01HwSVed1uS52zybzXe_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i4/2214598466035/O1CN013knBSe1uS52p0yet7_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01RuPrLz1uS531WXAU9_!!2214598466035.png;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01EADOSx1uS52v90Uwd_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01mJX6eO1uS52p13QMD_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01g3B9jh1uS52kFhuxc_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01AYYHoO1uS52tWNkyy_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01fDUIH61uS52xjQfRG_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01oMRrDc1uS52zaPL8d_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01XSlyAP1uS530KzGH3_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01pOeyEl1uS52rAd3mR_!!2214598466035.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('RedmiNote135G手机', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={时光蓝,子夜黑,星沙白};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01EdyL2L29zGByi5eHh_!!1714128138.png_q50.jpg_.webp;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN019czTCy29zG42hWOYF_!!1714128138.jpg_q50.jpg_.webp;
https://gw.alicdn.com/imgextra/i4/1714128138/O1CN01RYCbjA29zG3uBVbqL_!!1714128138.jpg;
https://gw.alicdn.com/imgextra/i1/1714128138/O1CN01TpMo3n29zG3vwx5ep_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01iZU2Nq29zGCN199n4_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01lWvMYw29zGC2wj1NB_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01UdDKon29zGBu1wvdy_!!1714128138.png;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01FfXzbt29zGBtLhXsG_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01CBrYtN29zGBuOV0VQ_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01VYMiGd29zGBsrKYA7_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN011D30M929zGBtZFqXX_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01DdprSR29zGBrT3CMy_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01bL8T5d29zGBsrK9Cg_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01GvBuIK29zGBrT2C2E_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01B9afZf29zGBrgYyNJ_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01c6ZAAJ29zGBtZDV3P_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01FmUqPN29zGBrT3X9Y_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01gli6vT29zGBwGg0ZT_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01KWGNQg29zGBv7y7ZQ_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN018ASqC529zGBmO96aC_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01iqmVoT29zGBtZGeSO_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01iSyx6H29zGBtZGNoO_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01wVAzq529zGBuOV8p8_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01IMLtJl29zGBuPYnnF_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01IMLtJl29zGBuPYnnF_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01m01gcx29zGBrT2vl5_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01jHxrAp29zGBtLktlc_!!1714128138.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('Apple/苹果iPhone16ProMax', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={黑色钛金属,白色钛金属,原色钛金属,沙漠色钛金属};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i3/1710936647/O1CN01PMDvih1yyNdnrq2ev_!!0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i2/1710936647/O1CN01ZP6cfw1yyNdp9w7l3_!!1710936647.png;
https://gw.alicdn.com/imgextra/i2/1710936647/O1CN011eS9IQ1yyNdnqHq80_!!1710936647.jpg;
https://gw.alicdn.com/imgextra/i2/1710936647/O1CN01eeOZli1yyNdpiZwKy_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01ejmfxr1yyNdp2WeHZ_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01HbX7WX1yyNdnX2SIb_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01g8weNF1yyNaePme15_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN01DRqh1s1yyNdmktaVv_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN01PpvUgE1yyNdrjt29a_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01DfWCeA1yyNdpgK661_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01Bpearq1yyNdnX5PHA_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01j8bc8R1yyNdpkK6fC_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01Fi7XWE1yyNdrXglRY_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01OXZXkY1yyNdp2WiRM_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01XOWuDn1yyNdnnxdFg_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN0130m1HA1yyNdsp9QlS_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01oqyLWg1yyNdsJA0el_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01z75GhF1yyNdiLJ0hq_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01y21JdV1yyNdpdvLbh_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01Az9JFS1yyNdnX5wWW_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01hK3nBr1yyNdqKwKR3_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01aLIc0n1yyNdrXiEux_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01WFaLQj1yyNdrjrDuh_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01znCX671yyNdpdxYno_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01XPqsWp1yyNdqKvBrT_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01WPcqOC1yyNdnnuwwG_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN018MvLVs1yyNdp8ieXf_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN01Pbbb3Y1yyNdpdv4wV_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN016ykZ341yyNdpgHTsI_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01UyEXx81yyNdnX5XZU_!!1710936647.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('荣耀Magic7直屏智能手机', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={绒黑色,雪域白,月影灰,天际蓝};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i3/1114511827/O1CN01ux0V4c1PMod0LVjZC_!!4611686018427386323-0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i3/1114511827/O1CN01BUHj4B1PMocwBI9gQ_!!1114511827.jpg;
https://gw.alicdn.com/imgextra/i2/1114511827/O1CN01WZJCeJ1PMoctyTckw_!!1114511827.jpg;
https://gw.alicdn.com/imgextra/i2/1114511827/O1CN01Ws5cWM1PMocIKXavn_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01fDTmPH1PMocHYL1YT_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN017s8cpE1PMocHYK9VQ_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01ygp4d71PMocuH7UIQ_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01C1z7yG1PMocsirpDt_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01AphxlV1PMocGZRyqw_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01MHRsGi1PMocIiKvuW_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01JliEmL1PMocLfdboE_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01li5ojG1PMocGZPld1_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01LBSkqh1PMocLB9Eg4_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01cDTP3R1PMocKHyelg_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN011RD96K1PMocJvf0vH_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01vbTKi21PMocKJBr0v_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01Jk4h9j1PMocCDVNc4_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01D30xfk1PMocLB9AXY_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01DiLA581PMocJK4hud_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01h9PSeQ1PMocJPhvYN_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01A6KrRE1PMocHYNuOx_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01YQ3fFP1PMocIpRCJh_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01P5EU2b1PMocIiKvud_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01erKoOp1PMocGZOpOe_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01bdcf501PMocHYN2Li_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01NoBkYi1PMocLB9yPS_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01wNQx651PMocMCrMb0_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01Iw97Q51PMocKHxqtm_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01grMRXJ1PMocMCuJWG_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN010rg0YD1PMocHJ4YZx_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01Ph3AJG1PMocJK4qEo_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN014MKaP51PMocMCr5xH_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01awiinj1PMocGZSRzJ_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01srcoQH1PMocIpSbcs_!!1114511827.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('荣耀X605G智能手机', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={月影白,海湖青,雅典黑};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i2/2201438992231/O1CN01cqY52L1SLqdPi4rBs_!!4611686018427385703-0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i4/2201438992231/O1CN01rjNRgt1SLqcUuve1H_!!2201438992231.jpg;
https://gw.alicdn.com/imgextra/i4/2201438992231/O1CN0160nSP41SLqcWjfsbJ_!!2201438992231.jpg;
https://gw.alicdn.com/imgextra/i4/2201438992231/O1CN01ib1LCL1SLqcYUOsEb_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01S7yQXM1SLqcXzYjzT_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN01IgbDFS1SLqcddiI0O_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01Vhrlxo1SLqcgLtDvf_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01eXrpSD1SLqcglZSHL_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01kj3YGi1SLqcfkc3Bs_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN01E34Aep1SLqcglaWmx_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i3/2201438992231/O1CN01XEBSSZ1SLqchStAqI_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN013ndtVw1SLqcglZSHY_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i3/2201438992231/O1CN01wyB0RB1SLqcYX7Olq_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i1/2201438992231/O1CN01MaL4Zp1SLqcctrwwq_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i1/2201438992231/O1CN01y1fw701SLqciiRxA2_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN01bbWJw01SLqcYX7Svn_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01044k9p1SLqcfkdzm5_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i3/2201438992231/O1CN01zGcHJ91SLqcdvvxn2_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i1/2201438992231/O1CN01LKt0o21SLqciiRPtW_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN019z0UbA1SLqcgLtct6_!!2201438992231.jpg;

', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('vivoS20Pro', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={凤羽金,紫气东来,松烟墨};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i1/2207440821122/O1CN01f7ckWw1K9vOs9mwuW_!!2207440821122.png;
https://gw.alicdn.com/imgextra/i4/2207440821122/O1CN01w0IqGn1K9vOumMOhm_!!2207440821122.jpg;
https://gw.alicdn.com/imgextra/i3/2207440821122/O1CN01LrrhUJ1K9vOqbV5HC_!!2207440821122.jpg;
https://gw.alicdn.com/imgextra/i3/2207440821122/O1CN015zh7ec1K9vOspMn3k_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01paJ7kT1K9vOvPZXgp_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN011Tlnyj1K9vOu7CHFC_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN011ZsNoq1K9vOrWYrZ8_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN0199BeEZ1K9vOt4ZYQr_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01uBHrBs1K9vOrJ7FcY_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01TRklme1K9vOslu92N_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN017HhmM91K9vOt4HpkG_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01EAMfUZ1K9vOu7BXWq_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01vMxyLS1K9vOu3uOUB_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN010HIR1k1K9vOsdKJPO_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01G5eqBl1K9vOtNHccH_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01hhAK3s1K9vOrIprb6_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01ihdGZr1K9vOt4I2Ft_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01IWFSpd1K9vOmG08Ih_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01t5L45x1K9vOsdZxHj_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01OlfCVw1K9vOsdKurT_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01Plx4nn1K9vOrWZ42t_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN012J30X61K9vOqbg1Cn_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01U5qoLu1K9vOuqudSf_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN012qBhD21K9vOtAyaBD_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01nWLuQz1K9vOqbeoO4_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN014H4NNR1K9vOumdWDh_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01Cw75Jg1K9vOt4Z1DP_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01xJLdy91K9vOumceAV_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01OrpDjV1K9vOu7BTL0_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01OZqTf81K9vOvt7iDN_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01O67AOm1K9vOu3rmH0_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN017DIx3X1K9vOuqv6Z1_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01u98rDb1K9vOuqvqJV_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01PJQq5A1K9vOu7CXsG_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01q2gUDz1K9vOt4Zcb0_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN018imGdG1K9vOsm7ROU_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01FFIaux1K9vOt4J2f6_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN017XNAY81K9vOtjoyg5_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01XDu5vE1K9vOtjqecO_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01KsI7FD1K9vOuqv6ZB_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01LKsqZY1K9vOsdaQMr_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN011Bkm7F1K9vOsdZ5EJ_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01enVQDv1K9vOqbhhBj_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01zrTKog1K9vOrWWqoc_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01Xhy19q1K9vOvt7F6A_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01e6x0nb1K9vOumPLz2_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01r4HoJn1K9vOqbRv8S_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01WmEp0p1K9vOtNJANr_!!2207440821122.jpg;

', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('OPPOReno13Pro', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={蝴蝶紫,午夜黑,星光粉};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN017ZVSFC1qyMj22Sb9k_!!2208778335564.jpg_q50.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN013POCaN1qyMizHL3FU_!!2208778335564.jpg_q50.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN0175S4zc1qyMinjLd8A_!!2208778335564.jpg_q50.jpg;
https://gw.alicdn.com/imgextra/i2/2208778335564/O1CN01Xgu4vX1qyMiuZ6dQJ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01aXLfBU1qyMiuWrObK_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01YFKmke1qyMivZlNLn_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01T9FZmT1qyMit0sW5I_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01OLPI1u1qyMiwMvLoC_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN015GWFty1qyMiu96jKc_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01pAwZdu1qyMivZli8M_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01JidHLR1qyMiu98PHZ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01iDeJWn1qyMiwMuPaZ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01oMhwWY1qyMivZlJBS_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01jszaN81qyMiskhO6V_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN013CgN8v1qyMisnZQgc_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01EgCGBx1qyMiuZYE9x_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01haWrdV1qyMiuWpqs4_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01gBcr911qyMivX8RXv_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01nZHzJt1qyMiupZSdj_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN012Y9PvD1qyMiu9748U_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN012tlZuY1qyMiuGP4kN_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01EtLtjN1qyMiskh3K6_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01QOxfD41qyMiwMuD81_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01ww7eoR1qyMisnYUSs_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01cZAEa91qyMiwt3ESt_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01hxoH8k1qyMinh3RMc_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01AaiWeV1qyMivZrPhu_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01YqiIX51qyMiug10yO_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01LzW0t01qyMit0t7Tw_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01lyNIFr1qyMixP8dDe_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01F8a29q1qyMixPBaBz_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN0141jxpV1qyMiwI5jHK_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01SXw5C81qyMiuZaRNq_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01gCDuYH1qyMixPAArr_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01KWMOnV1qyMit0rqU9_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01vEg5YD1qyMis2QC7A_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN016m6UVI1qyMiwKDJWa_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01pM7FAq1qyMivD4AKJ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01gDor1x1qyMiwKDmdY_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN013ANlMO1qyMis2SboZ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01jIXLdU1qyMivZrssk_!!2208778335564.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('小米Redmi Book', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={银白色,黑耀色};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01X3Sv3W29zGBilbmJo_!!4611686018427381002-0-item_pic.jpg_.webp;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01zFlOWl29zG6PFaQPh_!!1714128138.jpg_.webp;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01gJEaGz29zG8DRsMTA_!!1714128138.jpg_.webp;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01yj7hfC29zG81AvLtU_!!1714128138.jpg_.webp;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01VdKR4N29zGA4boi6T_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01zrda5b29zG6MeCpZY_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01jmsbKN29zG5teeX7n_!!1714128138.jpg;
        ', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('惠普轻薄笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={银色,粉色};硬盘容量={512G,1TB};内存容量={8GB,16GB,32GB}', 19.90,
        100, 1, '
https://img.alicdn.com/imgextra/i2/133668489/O1CN01WLSQbh2Ca1CkdquB0_!!0-item_pic.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01e6fIdu2Ca1CjuAUu6_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01kuDRX32Ca1ByioO58_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01e6fIdu2Ca1CjuAUu6_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN011ULxGP2Ca1Cea0lnY_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01FxBPUF2Ca1Cpp47rd_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Jmxbp02Ca1CqzFJZB_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01vbDGwM2Ca1CkT8k8o_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN019g7eI62Ca1CrbYbHQ_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01JWdQYp2Ca1Cr6OfGD_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01VndbLY2Ca1CWq67iK_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01T83t332Ca19YpT9Vb_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01fkbIGo2Ca1CtQCDEY_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01japPBv2Ca1CXXZ1SH_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01gYVkku2Ca1CYza7lT_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Qs7zcB2Ca1CYc9FBt_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN013BO3Ll2Ca1CYSCu2l_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01zc1SOL2Ca1CX87Yrh_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01JuOjP62Ca1CYzbX4H_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01LBZTlg2Ca1CXXKWnG_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01tfXuZp2Ca1CPHpkPS_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Vt73FI2Ca1CZWhy0r_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01uFagDD2Ca1CYHAGI2_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN018nfUJi2Ca1CXXYkpP_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01zGDS9h2Ca1CVu1ogR_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01FN8NIV2Ca1CUOuBAA_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01plBx8V2Ca1CWXjQKq_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01sHiDvg2Ca1CXXNLRh_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01XTHP5a2Ca1CVyVXwy_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01w2Mq4w2Ca1CWXiHei_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN013foOOJ2Ca1CXXMbi0_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01NLCvul2Ca1CTeAaLQ_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN0190c8xQ2Ca1CXXXLZv_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN014AvTLG2Ca1CXXKOV1_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01SzFtFa2Ca1CWXixEz_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01ZieqeU2Ca1CUj4xiM_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01Xu7TXI2Ca172gDsZO_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01S2L9pq2Ca1CYzd4hz_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01vyyb5i2Ca1CYSCZF2_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01sMYu9s2Ca164m5h8b_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN0128CLy52Ca19TJCXZE_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01eg5xnF2Ca1CaQ4fUi_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01fQ0Rgt2Ca1CYh7JgA_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01i8meU62Ca1Cb8YlCY_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01F4z9QU2Ca1CVp5OcO_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01SC1yOf2Ca1CaQ2iws_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01hOd07y2Ca1Cb8YUb1_!!133668489.jpg;
https://img.alicdn.com/imgextra/i3/133668489/O1CN01Iug7NE2Ca1CWseK5w_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN01BW1LPO2Ca1CRSMnCI_!!133668489.jpg;
https://img.alicdn.com/imgextra/i4/133668489/O1CN017AWY2I2Ca1CWZZHGr_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01dOcb5F2Ca1CYH9ait_!!133668489.jpg;
https://img.alicdn.com/imgextra/i1/133668489/O1CN01R0OzxW2Ca1CTe8N6W_!!133668489.jpg;
https://img.alicdn.com/imgextra/i2/133668489/O1CN01duYDGm2Ca11Qzst6O_!!133668489.png;
https://img.alicdn.com/imgextra/i3/O1CN01MsWlBa29wVnysxUvn_!!6000000008132-2-tps-750-880.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('华硕14 2024 全新一代酷睿记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={树莓蜜粉,香草罗勒,栀子幻白};硬盘容量={512G,1TB};内存容量={16GB,32GB}',
        19.90, 100, 1, '
https://picasso.alicdn.com/imgextra/O1CNA105SXuO1bORPMLF3hR_!!686773455-0-psf.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN011xx7bu1bORMQtsywO_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01453ENU1bORMUCdNdr_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01EuyNM21bORO8N9OtT_!!686773455.jpg_.webp;
https://img.alicdn.com/imgextra/i4/686773455/O1CN0103ZMY81bORO6DeVmk_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN016nMM3L1bORMQ31Tgm_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01QchwtW1bORPGyTsSW_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN017wyqo21bORMU7pIwj_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01Kc6ASb1bORMOW2RCn_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN016omqJr1bORMSHLZnH_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01PXrh4X1bORODQ3vyn_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN011l1rBF1bOROE9XJc2_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN013Swb8f1bOROGjGKaB_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN017t1mur1bORMQMnH5k_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN013WHlg91bORMSHIUX7_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01Bnkiyy1bORMRhsFJM_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN018DBU8Z1bORMQMlb7B_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01mnfSEZ1bORMQonBWx_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01jWAgvU1bORMO8ZABR_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN019udruO1bORMRhrVZY_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01dNnJA51bORMQ33URd_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01KJcSvV1bORMTOZ15R_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01TtdvZI1bORMIfQX7N_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01CTArzW1bORKhVqTp5_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01yuU5OB1bORDZbd5k9_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01DbNLyq1bORDWPTDFX_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01ZwwJ3m1bORJULBl1A_!!686773455.jpg;
https://img.alicdn.com/imgextra/imgextra/i2/686773455/O1CN01yp3vHY1bOR9NWhb0V_!!686773455.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('联想笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={银色,灰色,黑色};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://img.alicdn.com/imgextra/i2/2955374408/O1CN013shNbq1iQurYmMIFv_!!4611686018427383624-2-item_pic.png_.webp;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01tSRn8w1iQunvAxG3N_!!2955374408.png_.webp;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01qNbIr11iQunuLusBz_!!2955374408.png_.webp;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01oOiFAj1iQunsFU6ar_!!2955374408.png_.webp;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01itQEQQ1iQufA4uLAB_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01jaTEH21iQum37G0e3_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN018jTIvR1iQuqaGMMCq_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01VeyRTf1iQufCLvf15_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN01quRPFj1iQurXPCAVQ_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01SnMGis1iQurV2UuGA_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01OhaAOR1iQurV2VqTh_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN018LNVTJ1iQurTVV7uQ_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN01uaXdfV1iQurXsbCpu_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN016eQqRy1iQurVT3rA3_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN012o3iQ31iQurUvIrxP_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01ZgTNaf1iQuf7xqzY0_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i2/2955374408/O1CN01PM4dEm1iQurXsbXdE_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i3/2955374408/O1CN01ilOUz31iQurUvIw6W_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01NEvVbY1iQurSlnNie_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i1/2955374408/O1CN01NEvVbY1iQurSlnNie_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i4/2955374408/O1CN010d7KdR1iQur4RvYaZ_!!2955374408.jpg;
https://img.alicdn.com/imgextra/i3/O1CN01MsWlBa29wVnysxUvn_!!6000000008132-2-tps-750-880.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('荣耀MagicBook笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={冰河银,高级灰,石墨黑};硬盘容量={512G,1TB};内存容量={16GB,32GB}',
        19.90, 100, 1, '
https://img.alicdn.com/imgextra/i2/3261336459/O1CN018qLtyt1xaHBSI1BW6_!!2-item_pic.png_q50.jpg_.webp;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01SfZ4lq1xaHBRtuz3z_!!3261336459.jpg_.webp;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01qkX70c1xaHBQwqaqr_!!3261336459.jpg_.webp;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN01bma2TE1xaHBNkyUcR_!!3261336459.jpg_.webp;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01qtDiDh1xaHBN80epH_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01bv4h8m1xaHBPzuj7Q_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01rU3KFP1xaHBPYvnEt_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN01cZZjjQ1xaHBRwTDXc_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01HMgt4o1xaHBQhmoaR_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01jU14QK1xaH0U40oC9_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01nOVizQ1xaH0ayP92Q_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01Hpvang1xaH0ayPkVG_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01fzTvsZ1xaH0Wl5qvS_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01YfbqbK1xaH0Klgz6e_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01RSwhmH1xaH0QoSXDg_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01lEHt8R1xaH0Kli7nt_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01bQRNID1xaH0U41oZe_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01G7hZay1xaH0boZDCh_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01O7EUwh1xaH0ZEC87Y_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01VKOjsx1xaH0RYFzEk_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01JKkujd1xaH0RYGzdq_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN018aRzIO1xaH0VaPvQn_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN014Wwz2x1xaH0PT260u_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01ZORamg1xaH0U42cRp_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01OuAHVd1xaH0TduWXT_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN01IWsST51xaH0ayRMJh_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01cAWl9x1xaH0VaO2zD_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN013ytMgS1xaH0RYGj1u_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN010Q3iYW1xaH0ThRBfY_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN013MRBex1xaH0RYJk9q_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01C3duTg1xaH0TdycZS_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01ftrk6u1xaH0ZthOca_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN012bbXgG1xaH0Tdy5J9_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01zz6L491xaH0RYHGIt_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01B5dlt11xaH0ayQYOd_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01LoCgnd1xaH0XWsdEd_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/3261336459/O1CN01hPc9QV1xaH0RYI4Cz_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01mVnuxb1xaH0RYHGJ6_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i1/3261336459/O1CN01H70pMm1xaH0boWzzC_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i4/3261336459/O1CN01J5Ynew1xaH0ZECfOP_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i2/3261336459/O1CN013CEg8p1xaH0QoSs22_!!3261336459.jpg;
https://img.alicdn.com/imgextra/i3/O1CN01MsWlBa29wVnysxUvn_!!6000000008132-2-tps-750-880.png;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('华硕天选4 13代英特尔酷睿笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={魔幻青,日蚀灰};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://gw.alicdn.com/imgextra/O1CN01xdtsCB1bORPYtDrV9_!!686773455-0-picasso.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01ZLR64r1bOROw99kW3_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01aeFp2j1bOROtYx7RW_!!686773455.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01iSUUHS1bORDnJretP_!!686773455.jpg_.webp;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01mQjrGr1bORPXEAmGK_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01r5kzWN1bOROlHi84a_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01cdZzwN1bORORqHdw2_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01VOg1GK1bOROv8nOvu_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01l7Owyn1bOROu7dJ3m_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01QrG1IU1bOROxBcSsJ_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN014kpBBg1bOROryjTiC_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01NAVFHz1bOROu46MkI_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01tLtBHz1bOROsChmme_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01Ly1ONk1bOROxBbG2l_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01ILMd6x1bOROxBaedC_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01uWvCz61bOROtQVsKS_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01ZIOqPR1bOROu7fr5M_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01c6Ba9Y1bOROweanNJ_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01kh8FpG1bOROujIFLg_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01lJRBv01bOROv8p0gn_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01aTSwA71bOROr9OQxH_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01ewXzOO1bOROw6pD1V_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN019ZdIK41bOROxBaFhJ_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01epPrRN1bOROtWlRH0_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01Noes1V1bOROsCfuO6_!!686773455.jpg;
https://img.alicdn.com/imgextra/i1/686773455/O1CN01aBaHUy1bOROmkDMoY_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01wh7zU11bOROujGuCG_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01zKtClM1bOROtsRCiV_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01YWV4dr1bOROvBPvWi_!!686773455.jpg;
https://img.alicdn.com/imgextra/i3/686773455/O1CN01VBkBVs1bOROx68QQH_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01QlEzXk1bOROuTbngX_!!686773455.jpg;
https://img.alicdn.com/imgextra/i2/686773455/O1CN01N5SSNR1bOROtyIOmG_!!686773455.jpg;
https://img.alicdn.com/imgextra/i4/686773455/O1CN01RgMNvI1bOROrbHPan_!!686773455.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('十三代RazerBlade雷蛇灵刃电竞游戏笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={魔幻青,日蚀灰};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, '
https://gw.alicdn.com/imgextra/O1CN011z2mEb1tuBx1AAssn_!!1085315961-0-picasso.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01t5Vev21tuBwWOtemp_!!1085315961.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01t5Vev21tuBwWOtemp_!!1085315961.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01n9AEjh1tuBwWubQm4_!!1085315961.jpg_.webp;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01fOqbwS1tuBx7ZIQLA_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01cah0Zw1tuBwzwFgHD_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01IXQDgm1tuBwtI8BW6_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN011U7ski1tuBuGmiAfk_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01TulN681tuBmxEre60_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN013rcVHD1tuBn2veK0R_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01FtTXYU1tuBurP2ajI_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN01VT6PQw1tuBwb3ZnJ8_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01SeCtGe1tuBwgUuqeP_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01hTfoqt1tuBustqQia_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01Ex7d961tuBwgBg48c_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01BinCoi1tuBwhg4rKg_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01nke9Jk1tuBuokhWcO_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01DFIizJ1tuBwfQfQGh_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN015bfjO91tuBwkmzouF_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01v2ZZ2i1tuBn6s3JC8_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01EgHJhv1tuBwkFxLcZ_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN017ZlPK01tuBwiJYBHA_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01EVLhjz1tuBn1GngY6_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN01PUkrIt1tuBwb3ZKDp_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN01d3JnKm1tuBwjKAuU6_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01ZLZpaj1tuBwjKAuUB_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN0167MV8S1tuBwgUua01_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i3/1085315961/O1CN01bp4cuZ1tuBuuSARpX_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01F9Mj0y1tuBwb3ZnJB_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01XV0ygk1tuBwhg3ie3_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN01B1A3Xw1tuBusttFIe_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01kqMEnc1tuBn1Go1Mo_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i4/1085315961/O1CN01zjkwBH1tuBwiFUu1x_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i2/1085315961/O1CN012VGvFG1tuBwhl34Vs_!!1085315961.jpg;
https://img.alicdn.com/imgextra/i1/1085315961/O1CN010ZczeB1tuBvDXdyf2_!!1085315961.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('橘宝MEOW R15电竞游戏笔记本电脑', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={雪影白,橘影橙};硬盘容量={512G,1TB};内存容量={16GB,32GB}', 19.90,
        100, 1, 'https://picasso.alicdn.com/imgextra/O1CNA1e2xmHk1Jgc2YKpo5j_!!2651871058-0-psf.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01mDsDUS1Jgbxs9EE5g_!!2651871058.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN012h3OKA1JgbxwBmkVE_!!2651871058.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01PF9S5p1JgbxxfWNSe_!!2651871058.jpg_.webp;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01BjMRmX1Jgc20kCmng_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN018FxYqy1JgbzphlMjF_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN011mOkHB1JgbzgJpguX_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01YYkV5y1JgbzFhLoE1_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01dY9WVX1JgbzKVb4Q6_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01IXYRCs1JgbxwGoJW9_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01TwNe131JgbzFyL0Lh_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01dqK01z1JgbzJr2gGQ_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01A8ROcT1JgbzJr0fWe_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01CCRMOr1Jgbz8I96e9_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01OdM3Vz1Jgbxt9bVPR_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01fz2tq41JgbzCnRPVs_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01zVCPMU1JgbzKVckKQ_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01AlS2041Jgc01zYkJm_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01BC6BbN1Jgbxyl56KV_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01kZiJge1JgbzJ6YnZ3_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01STD2qy1JgbzHy7u4H_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01ZghZY11JgbzGTIb09_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01pOBt4S1JgbzHprvlC_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01w4s8PP1Jgby0Ykoop_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01cObAfF1JgbzE9072m_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01Zy6kPV1JgbzCnOvfl_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01CteVOc1JgbxvQHt0u_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01tjDpsb1JgbxzuZeqv_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01dBvwmN1JgbzjrjVDr_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01WYUzzF1JgbziFAv9x_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01UsQTni1JgbzkJiaxS_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01p8AsOu1JgbzmFBoeh_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01DQLfyI1JgbzfSY4VW_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01vQF4iK1JgbzkQCSly_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN01K0l3QI1JgbzkQ9Vmo_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01buNa2B1JgbzjrY5Y8_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN012mPen21JgbzgLmneC_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01XpOI1z1Jgbzia5D3p_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i4/2651871058/O1CN01zMIfsb1JgbzjrZEDv_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01bW5FdF1JgbzjrXov9_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN019flALy1Jgbzia4PAB_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i2/2651871058/O1CN0164QFjd1JgbzlVMsrB_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN010nsAS71Jgbzia60xW_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i3/2651871058/O1CN01xWhFR11JgbzlVLLGQ_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01Jiymne1JgbzfSKNJA_!!2651871058.jpg;
https://img.alicdn.com/imgextra/i1/2651871058/O1CN01taIxVL1Jgc0fGOqGp_!!2651871058.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('Apple MacBook air', 1,
        'main={机身颜色,硬盘容量,内存容量};机身颜色={深空灰,银色,午夜色,星光色};硬盘容量={256G,512G};内存容量={8GB,16GB}',
        19.90, 100, 1, '
https://gw.alicdn.com/imgextra/O1CN01KbAPcP1idjvlQFPhM_!!2200877014436.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01RYtSSB1idjvjV5zfA_!!2200877014436.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01bZgdBX1idjvkdT0VD_!!2200877014436.jpg_.webp;
https://gw.alicdn.com/imgextra/O1CN01Ffyf0K1idjvlQFTvU_!!2200877014436.jpg_.webp;
https://img.alicdn.com/imgextra/i1/2217102796746/O1CN01yQ9UWn1zhiqHi3ZzS_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i1/2217102796746/O1CN01UuJudr1zhiq5gM1lV_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i3/2217102796746/O1CN01e8rJuj1zhiq3oHbJp_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i4/2217102796746/O1CN01TGb46e1zhipwoSnaP_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i2/2217102796746/O1CN01P0E9u51zhiq5ZXPc1_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i4/2217102796746/O1CN014LH0tR1zhiq6edXdY_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i1/2217102796746/O1CN01iz6Nw21zhiq4U64Wa_!!2217102796746-0-scmitem1000.jpg;
https://img.alicdn.com/imgextra/i4/2217102796746/O1CN01W6V6aQ1zhiq3hxfqs_!!2217102796746-0-scmitem1000.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('vivoiQOO13新品骁龙8至尊版', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={赛道版,传奇版,纳多灰};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/O1CN01XMz1sC23opTxkvfQO_!!883737303-0-picasso.jpg;
https://gw.alicdn.com/imgextra/O1CN018eY9fH23opTLboFQX_!!883737303.jpg;
https://gw.alicdn.com/imgextra/O1CN01XGIqgc23opTNdIoG2_!!883737303.jpg;
https://gw.alicdn.com/imgextra/O1CN01CNRstt23opTLbl62F_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01QNFmRr23opTNg811j_!!883737303.png;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01ngLx1W23opTMehYmd_!!883737303.png;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01z6MPb923opTqWNIkb_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01N8KKIv23opTo2vzvm_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01tFoE3n23opTqfBhro_!!883737303.png;
https://img.alicdn.com/imgextra/i2/883737303/O1CN017uygVg23opTQAUn4d_!!883737303.png;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01iUD5DF23opTP7RZDh_!!883737303.png;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01mfdOv723opTQzFezW_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01tFeM8323opTgZ91vq_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN013TG6Ex23opTOV4yNE_!!883737303.png;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01KtqHwY23opTRYJqx0_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01fzZ1qx23opTrAcF1z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01K0XwN323opTpUvyFy_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01SxtJ6b23opTp4R6gZ_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01Jxp6cu23opTon6IqP_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01dlvHN823opTon7AuU_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN011vqXAu23opTpqFBBG_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01Fy0RI123opTqYMmTn_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01ILhAXF23opTpUuYwX_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01qpWRr123opTQ8Dchm_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01RnMbiB23opTon9FnT_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01U8DqXN23opTouHCI4_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01lKe3Nb23opToLwQeo_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01DJ1meK23opTp4Sz7Z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01IKxfiV23opTpqCtqa_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01YpH29t23opTmzZIjg_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01UrPRgh23opTMjw9Y8_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01ojoMU523opTp4TvLx_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01x7bSCl23opTmzXgve_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01l0jgjV23opTqcDqkD_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN011eAG1e23opThvs89a_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01Bfcpvr23opTqYOj3U_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN018qev1K23opTouHKZC_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01T0OmiJ23opTMjy20z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01bfT8WB23opTmHFtPC_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN013zFq5n23opTNF073Z_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN016fxdRm23opTon8Rub_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01iJnehM23opTouITDi_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01DOuFRG23opTmHGd9o_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01lnEUZE23opTouIfhk_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01Pcp3UW23opTpUuUm6_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN018GVs7U23opTpUuE91_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01jI3FIa23opToLwd80_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01o3DlN323opThvtPA8_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN0126SDRZ23opTmzYYzE_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01QfBNMh23opTon82yu_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01OKhmUz23opTppWCc8_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01oShyjB23opTpUuYwk_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01YQL9wR23opTrdudRI_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01TwKbJf23opTp4SRqn_!!883737303.jpg;
https://img.alicdn.com/imgextra/i2/883737303/O1CN01fhAR1M23opTqcCyiT_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01qjYDoX23opTpUuxsk_!!883737303.jpg;
https://img.alicdn.com/imgextra/i4/883737303/O1CN01t5PBsp23opTrdt5nM_!!883737303.jpg;
https://img.alicdn.com/imgextra/i1/883737303/O1CN01iNl0Hb23opToLvQJC_!!883737303.jpg;
https://img.alicdn.com/imgextra/i3/883737303/O1CN01WB86JF23opTsgPERX_!!883737303.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('realme真我GT2大师探索版', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={旷野,冰岛,苍岩,晨曦};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01RuPrLz1uS531WXAU9_!!2214598466035.png;
https://img.alicdn.com/imgextra/i2/2214598466035/O1CN0135I1tY1uS532Ow08y_!!2214598466035.jpg;
https://gw.alicdn.com/imgextra/i3/2214598466035/O1CN01fDUIH61uS52xjQfRG_!!2214598466035.jpg;
https://gw.alicdn.com/imgextra/i3/2214598466035/O1CN01XSlyAP1uS530KzGH3_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i2/2214598466035/O1CN01HwSVed1uS52zybzXe_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i2/2214598466035/O1CN01HwSVed1uS52zybzXe_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i4/2214598466035/O1CN013knBSe1uS52p0yet7_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01RuPrLz1uS531WXAU9_!!2214598466035.png;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01EADOSx1uS52v90Uwd_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01mJX6eO1uS52p13QMD_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01g3B9jh1uS52kFhuxc_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01AYYHoO1uS52tWNkyy_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01fDUIH61uS52xjQfRG_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01oMRrDc1uS52zaPL8d_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01XSlyAP1uS530KzGH3_!!2214598466035.jpg;
https://img.alicdn.com/imgextra/i3/2214598466035/O1CN01pOeyEl1uS52rAd3mR_!!2214598466035.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('RedmiNote135G手机', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={时光蓝,子夜黑,星沙白};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01EdyL2L29zGByi5eHh_!!1714128138.png_q50.jpg_.webp;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN019czTCy29zG42hWOYF_!!1714128138.jpg_q50.jpg_.webp;
https://gw.alicdn.com/imgextra/i4/1714128138/O1CN01RYCbjA29zG3uBVbqL_!!1714128138.jpg;
https://gw.alicdn.com/imgextra/i1/1714128138/O1CN01TpMo3n29zG3vwx5ep_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01iZU2Nq29zGCN199n4_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01lWvMYw29zGC2wj1NB_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01UdDKon29zGBu1wvdy_!!1714128138.png;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01FfXzbt29zGBtLhXsG_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01CBrYtN29zGBuOV0VQ_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01VYMiGd29zGBsrKYA7_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN011D30M929zGBtZFqXX_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01DdprSR29zGBrT3CMy_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01bL8T5d29zGBsrK9Cg_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01GvBuIK29zGBrT2C2E_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01B9afZf29zGBrgYyNJ_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01c6ZAAJ29zGBtZDV3P_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01FmUqPN29zGBrT3X9Y_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01gli6vT29zGBwGg0ZT_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i1/1714128138/O1CN01KWGNQg29zGBv7y7ZQ_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN018ASqC529zGBmO96aC_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01iqmVoT29zGBtZGeSO_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01iSyx6H29zGBtZGNoO_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01wVAzq529zGBuOV8p8_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01IMLtJl29zGBuPYnnF_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i2/1714128138/O1CN01IMLtJl29zGBuPYnnF_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i4/1714128138/O1CN01m01gcx29zGBrT2vl5_!!1714128138.jpg;
https://img.alicdn.com/imgextra/i3/1714128138/O1CN01jHxrAp29zGBtLktlc_!!1714128138.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('Apple/苹果iPhone16ProMax', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={黑色钛金属,白色钛金属,原色钛金属,沙漠色钛金属};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i3/1710936647/O1CN01PMDvih1yyNdnrq2ev_!!0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i2/1710936647/O1CN01ZP6cfw1yyNdp9w7l3_!!1710936647.png;
https://gw.alicdn.com/imgextra/i2/1710936647/O1CN011eS9IQ1yyNdnqHq80_!!1710936647.jpg;
https://gw.alicdn.com/imgextra/i2/1710936647/O1CN01eeOZli1yyNdpiZwKy_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01ejmfxr1yyNdp2WeHZ_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01HbX7WX1yyNdnX2SIb_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01g8weNF1yyNaePme15_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN01DRqh1s1yyNdmktaVv_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN01PpvUgE1yyNdrjt29a_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01DfWCeA1yyNdpgK661_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01Bpearq1yyNdnX5PHA_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01j8bc8R1yyNdpkK6fC_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01Fi7XWE1yyNdrXglRY_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01OXZXkY1yyNdp2WiRM_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01XOWuDn1yyNdnnxdFg_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN0130m1HA1yyNdsp9QlS_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01oqyLWg1yyNdsJA0el_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01z75GhF1yyNdiLJ0hq_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01y21JdV1yyNdpdvLbh_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01Az9JFS1yyNdnX5wWW_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01hK3nBr1yyNdqKwKR3_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01aLIc0n1yyNdrXiEux_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01WFaLQj1yyNdrjrDuh_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN01znCX671yyNdpdxYno_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01XPqsWp1yyNdqKvBrT_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i1/1710936647/O1CN01WPcqOC1yyNdnnuwwG_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i3/1710936647/O1CN018MvLVs1yyNdp8ieXf_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN01Pbbb3Y1yyNdpdv4wV_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i4/1710936647/O1CN016ykZ341yyNdpgHTsI_!!1710936647.jpg;
https://img.alicdn.com/imgextra/i2/1710936647/O1CN01UyEXx81yyNdnX5XZU_!!1710936647.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('荣耀Magic7直屏智能手机', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={绒黑色,雪域白,月影灰,天际蓝};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i3/1114511827/O1CN01ux0V4c1PMod0LVjZC_!!4611686018427386323-0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i3/1114511827/O1CN01BUHj4B1PMocwBI9gQ_!!1114511827.jpg;
https://gw.alicdn.com/imgextra/i2/1114511827/O1CN01WZJCeJ1PMoctyTckw_!!1114511827.jpg;
https://gw.alicdn.com/imgextra/i2/1114511827/O1CN01Ws5cWM1PMocIKXavn_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01fDTmPH1PMocHYL1YT_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN017s8cpE1PMocHYK9VQ_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01ygp4d71PMocuH7UIQ_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01C1z7yG1PMocsirpDt_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01AphxlV1PMocGZRyqw_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01MHRsGi1PMocIiKvuW_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01JliEmL1PMocLfdboE_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01li5ojG1PMocGZPld1_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01LBSkqh1PMocLB9Eg4_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01cDTP3R1PMocKHyelg_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN011RD96K1PMocJvf0vH_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01vbTKi21PMocKJBr0v_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01Jk4h9j1PMocCDVNc4_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01D30xfk1PMocLB9AXY_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i1/1114511827/O1CN01DiLA581PMocJK4hud_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i3/1114511827/O1CN01h9PSeQ1PMocJPhvYN_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01A6KrRE1PMocHYNuOx_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01YQ3fFP1PMocIpRCJh_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01P5EU2b1PMocIiKvud_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01erKoOp1PMocGZOpOe_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01bdcf501PMocHYN2Li_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01NoBkYi1PMocLB9yPS_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01wNQx651PMocMCrMb0_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01Iw97Q51PMocKHxqtm_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01grMRXJ1PMocMCuJWG_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN010rg0YD1PMocHJ4YZx_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN01Ph3AJG1PMocJK4qEo_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i2/1114511827/O1CN014MKaP51PMocMCr5xH_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01awiinj1PMocGZSRzJ_!!1114511827.jpg;
https://img.alicdn.com/imgextra/i4/1114511827/O1CN01srcoQH1PMocIpSbcs_!!1114511827.jpg;
', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('荣耀X605G智能手机', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={月影白,海湖青,雅典黑};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i2/2201438992231/O1CN01cqY52L1SLqdPi4rBs_!!4611686018427385703-0-item_pic.jpg;
https://gw.alicdn.com/imgextra/i4/2201438992231/O1CN01rjNRgt1SLqcUuve1H_!!2201438992231.jpg;
https://gw.alicdn.com/imgextra/i4/2201438992231/O1CN0160nSP41SLqcWjfsbJ_!!2201438992231.jpg;
https://gw.alicdn.com/imgextra/i4/2201438992231/O1CN01ib1LCL1SLqcYUOsEb_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01S7yQXM1SLqcXzYjzT_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN01IgbDFS1SLqcddiI0O_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01Vhrlxo1SLqcgLtDvf_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01eXrpSD1SLqcglZSHL_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01kj3YGi1SLqcfkc3Bs_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN01E34Aep1SLqcglaWmx_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i3/2201438992231/O1CN01XEBSSZ1SLqchStAqI_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN013ndtVw1SLqcglZSHY_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i3/2201438992231/O1CN01wyB0RB1SLqcYX7Olq_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i1/2201438992231/O1CN01MaL4Zp1SLqcctrwwq_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i1/2201438992231/O1CN01y1fw701SLqciiRxA2_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN01bbWJw01SLqcYX7Svn_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i4/2201438992231/O1CN01044k9p1SLqcfkdzm5_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i3/2201438992231/O1CN01zGcHJ91SLqcdvvxn2_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i1/2201438992231/O1CN01LKt0o21SLqciiRPtW_!!2201438992231.jpg;
https://img.alicdn.com/imgextra/i2/2201438992231/O1CN019z0UbA1SLqcgLtct6_!!2201438992231.jpg;

', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('vivoS20Pro', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={凤羽金,紫气东来,松烟墨};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://gw.alicdn.com/imgextra/i1/2207440821122/O1CN01f7ckWw1K9vOs9mwuW_!!2207440821122.png;
https://gw.alicdn.com/imgextra/i4/2207440821122/O1CN01w0IqGn1K9vOumMOhm_!!2207440821122.jpg;
https://gw.alicdn.com/imgextra/i3/2207440821122/O1CN01LrrhUJ1K9vOqbV5HC_!!2207440821122.jpg;
https://gw.alicdn.com/imgextra/i3/2207440821122/O1CN015zh7ec1K9vOspMn3k_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01paJ7kT1K9vOvPZXgp_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN011Tlnyj1K9vOu7CHFC_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN011ZsNoq1K9vOrWYrZ8_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN0199BeEZ1K9vOt4ZYQr_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01uBHrBs1K9vOrJ7FcY_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01TRklme1K9vOslu92N_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN017HhmM91K9vOt4HpkG_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01EAMfUZ1K9vOu7BXWq_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01vMxyLS1K9vOu3uOUB_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN010HIR1k1K9vOsdKJPO_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01G5eqBl1K9vOtNHccH_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01hhAK3s1K9vOrIprb6_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01ihdGZr1K9vOt4I2Ft_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01IWFSpd1K9vOmG08Ih_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01t5L45x1K9vOsdZxHj_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01OlfCVw1K9vOsdKurT_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01Plx4nn1K9vOrWZ42t_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN012J30X61K9vOqbg1Cn_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01U5qoLu1K9vOuqudSf_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN012qBhD21K9vOtAyaBD_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01nWLuQz1K9vOqbeoO4_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN014H4NNR1K9vOumdWDh_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01Cw75Jg1K9vOt4Z1DP_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01xJLdy91K9vOumceAV_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01OrpDjV1K9vOu7BTL0_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01OZqTf81K9vOvt7iDN_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01O67AOm1K9vOu3rmH0_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN017DIx3X1K9vOuqv6Z1_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01u98rDb1K9vOuqvqJV_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01PJQq5A1K9vOu7CXsG_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01q2gUDz1K9vOt4Zcb0_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN018imGdG1K9vOsm7ROU_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i2/2207440821122/O1CN01FFIaux1K9vOt4J2f6_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN017XNAY81K9vOtjoyg5_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01XDu5vE1K9vOtjqecO_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01KsI7FD1K9vOuqv6ZB_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01LKsqZY1K9vOsdaQMr_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN011Bkm7F1K9vOsdZ5EJ_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01enVQDv1K9vOqbhhBj_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01zrTKog1K9vOrWWqoc_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i4/2207440821122/O1CN01Xhy19q1K9vOvt7F6A_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01e6x0nb1K9vOumPLz2_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i1/2207440821122/O1CN01r4HoJn1K9vOqbRv8S_!!2207440821122.jpg;
https://img.alicdn.com/imgextra/i3/2207440821122/O1CN01WmEp0p1K9vOtNJANr_!!2207440821122.jpg;

', '2024-12-07', '1');
INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('OPPOReno13Pro', 1,
        'main={机身颜色,存储容量,内存容量};机身颜色={蝴蝶紫,午夜黑,星光粉};存储容量={12GB,16GB};内存容量={256GB,512GB,1TB};',
        19.90, 100, 2, '
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN017ZVSFC1qyMj22Sb9k_!!2208778335564.jpg_q50.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN013POCaN1qyMizHL3FU_!!2208778335564.jpg_q50.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN0175S4zc1qyMinjLd8A_!!2208778335564.jpg_q50.jpg;
https://gw.alicdn.com/imgextra/i2/2208778335564/O1CN01Xgu4vX1qyMiuZ6dQJ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01aXLfBU1qyMiuWrObK_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01YFKmke1qyMivZlNLn_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01T9FZmT1qyMit0sW5I_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01OLPI1u1qyMiwMvLoC_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN015GWFty1qyMiu96jKc_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01pAwZdu1qyMivZli8M_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01JidHLR1qyMiu98PHZ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01iDeJWn1qyMiwMuPaZ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01oMhwWY1qyMivZlJBS_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01jszaN81qyMiskhO6V_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN013CgN8v1qyMisnZQgc_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01EgCGBx1qyMiuZYE9x_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01haWrdV1qyMiuWpqs4_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01gBcr911qyMivX8RXv_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01nZHzJt1qyMiupZSdj_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN012Y9PvD1qyMiu9748U_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN012tlZuY1qyMiuGP4kN_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01EtLtjN1qyMiskh3K6_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01QOxfD41qyMiwMuD81_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01ww7eoR1qyMisnYUSs_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01cZAEa91qyMiwt3ESt_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01hxoH8k1qyMinh3RMc_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01AaiWeV1qyMivZrPhu_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01YqiIX51qyMiug10yO_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01LzW0t01qyMit0t7Tw_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i4/2208778335564/O1CN01lyNIFr1qyMixP8dDe_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01F8a29q1qyMixPBaBz_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN0141jxpV1qyMiwI5jHK_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01SXw5C81qyMiuZaRNq_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN01gCDuYH1qyMixPAArr_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01KWMOnV1qyMit0rqU9_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01vEg5YD1qyMis2QC7A_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN016m6UVI1qyMiwKDJWa_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01pM7FAq1qyMivD4AKJ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i1/2208778335564/O1CN01gDor1x1qyMiwKDmdY_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i3/2208778335564/O1CN013ANlMO1qyMis2SboZ_!!2208778335564.jpg;
https://img.alicdn.com/imgextra/i2/2208778335564/O1CN01jIXLdU1qyMivZrssk_!!2208778335564.jpg;
', '2024-12-07', '1');

INSERT INTO products (ProductName, ProductStoreID, Description, Price, StockQuantity, CategoryID, ImageURL,
                      ListedDate, Status)
VALUES ('神州游戏笔记本电脑', 1, 'main={硬盘容量,内存容量};硬盘容量={512GB,1TB,2TB};内存容量={16GB,32GB,64GB}',
        19.90, 100, 1, 'https://gw.alicdn.com/imgextrga/i2/1078709264/O1CN01dQVK4D2IIy7VaThCW_!!1078709264.jpg;
https://gw.alicdn.com/imgextra/i3/1078709264/O1CN017FG9fI2IIxtBv6Qg0_!!1078709264.jpg;
https://gw.alicdn.com/imgextra/i2/1078709264/O1CN01RKdB8T2IIxtOaKA0n_!!1078709264.jpg;
https://gw.alicdn.com/imgextra/i2/1078709264/O1CN016iKDjx2IIy72mXXXL_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i2/1078709264/O1CN01NmkhAV2IIy8jC9pEI_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i3/1078709264/O1CN01shnUbX2IIy9MjoSml_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i1/1078709264/O1CN01bWE0t22IIy6kPEXvk_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i4/1078709264/O1CN01bP4Q1s2IIxz2qnsCW_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i4/1078709264/O1CN01xwmv6M2IIy5GY4Q70_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i2/1078709264/O1CN015V0pJD2IIy5Ej4bdN_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i3/1078709264/O1CN01VqpglC2IIy5DIxKxm_!!1078709264.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01Z0lXvV1yb1HKfnl8N_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01ELQbtM1yb1HF6RhCp_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01RjgcSI1yb1HAe7Cd2_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01bwPzKx1yb1HFJsIZ0_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01rf3YB91yb1HJRPx9K_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01vu4DJg1yb1HHN7CNi_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01bdYsih1yb1HH9iLRv_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01z5glHa1yb1HJT6cZW_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01gJZuSj1yb1HRJQaRV_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01QobwNN1yb1HLG7Ny1_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01vuCe7F1yb1HMQfzjz_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01i76DYg1yb1HKtRRzV_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01K19JTm1yb1HLG9X2B_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01W4vFpo1yb1HQTRKXq_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01sCMoYx1yb1HFJtdk3_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01NXY7PZ1yb1HKfnxcL_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01igWgKQ1yb1HPKurfx_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01orPjtq1yb1HMQeaQK_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01A4DTuW1yb1HPKvT3h_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i2/2201257266596/O1CN01PauKNT1yb1HJROwju_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01QM1oV51yb1HHN7jgE_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01AOKGkI1yb1HOnD26f_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01VGyFVy1yb1HR5wIHx_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01mYUlaJ1yb1HN9NN4V_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01EIBalJ1yb1HJROTd9_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01J3EpQP1yb1HH9hftF_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01lsRl2i1yb1HH9j9N2_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i3/2201257266596/O1CN01ReBzuA1yb1HMQe3AS_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01ezQdlE1yb1HJT6cXP_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01toyZ8z1yb1HKtOpqK_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i1/2201257266596/O1CN01toyZ8z1yb1HKtOpqK_!!2201257266596.jpg;
https://img.alicdn.com/imgextra/i4/2201257266596/O1CN01kJjNqS1yb1HGPAyM1_!!2201257266596.jpg;', '2024-12-07', '1');


INSERT INTO reviews (ProductID, UserID, Rating, Comment, ReviewTime)
VALUES (1, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (1, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (1, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (1, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (1, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (1, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价26', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (1, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (1, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (1, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (1, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (1, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (1, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (2, 1, 2, '评价5', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (2, 1, 1, '评价9', '2024-12-09 08:30:25'),
       (2, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (2, 1, 1, '评价14', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (2, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (2, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (2, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (2, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (2, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (2, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (2, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (2, 1, 2, '评价30', '2024-12-09 08:30:25'),
       (2, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (2, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (2, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (3, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (3, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价9', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价10', '2024-12-09 08:30:25'),
       (3, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (3, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (3, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (3, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (3, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价20', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (3, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (3, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价26', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价28', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (3, 1, 2, '评价31', '2024-12-09 08:30:25'),
       (3, 1, 5, '评价32', '2024-12-09 08:30:25'),
       (3, 1, 4, '评价33', '2024-12-09 08:30:25'),
       (3, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价7', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (4, 1, 1, '评价9', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (4, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (4, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (4, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (4, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (4, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (4, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (4, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (4, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (4, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (4, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (4, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (4, 1, 4, '评价28', '2024-12-09 08:30:25'),
       (4, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (4, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (4, 1, 5, '评价32', '2024-12-09 08:30:25'),
       (4, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (4, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (5, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (5, 1, 5, '评价4', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (5, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价9', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (5, 1, 2, '评价11', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (5, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (5, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (5, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (5, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (5, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (5, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (5, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (5, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价28', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (5, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (5, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (5, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (5, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (5, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (6, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价25', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (6, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (6, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (6, 1, 2, '评价31', '2024-12-09 08:30:25'),
       (6, 1, 5, '评价32', '2024-12-09 08:30:25'),
       (6, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (6, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价1', '2024-12-09 08:30:25'),
       (7, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (7, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (7, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价5', '2024-12-09 08:30:25'),
       (7, 1, 1, '评价6', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价7', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (7, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (7, 1, 1, '评价10', '2024-12-09 08:30:25'),
       (7, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (7, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (7, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (7, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (7, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (7, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价23', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (7, 1, 5, '评价25', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (7, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (7, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (7, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (7, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (7, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价9', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (8, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (8, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价25', '2024-12-09 08:30:25'),
       (8, 1, 1, '评价26', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (8, 1, 2, '评价30', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (8, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (8, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (8, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (9, 1, 2, '评价7', '2024-12-09 08:30:25'),
       (9, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (9, 1, 1, '评价10', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (9, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (9, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (9, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (9, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (9, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价24', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价25', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价28', '2024-12-09 08:30:25'),
       (9, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (9, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (9, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (9, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (9, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (10, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (10, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价4', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价5', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (10, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (10, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (10, 1, 1, '评价14', '2024-12-09 08:30:25'),
       (10, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (10, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (10, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (10, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (10, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (10, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (10, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (10, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (10, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (10, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (10, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价31', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (10, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (10, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (11, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (11, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (11, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (11, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (11, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (11, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (11, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (11, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (11, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (12, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (12, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (12, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价6', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (12, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (12, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (12, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价16', '2024-12-09 08:30:25'),
       (12, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (12, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (12, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (12, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (12, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (12, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (12, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (12, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价11', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价16', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (13, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (13, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (13, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (13, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (13, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (13, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (14, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (14, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (14, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (14, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (14, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (14, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (14, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (14, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (14, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (14, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (14, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (15, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (15, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (15, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (15, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (15, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价23', '2024-12-09 08:30:25'),
       (15, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (15, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (15, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (15, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (15, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (15, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (16, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (16, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价9', '2024-12-09 08:30:25'),
       (16, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (16, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (16, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (16, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (16, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (16, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (16, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (16, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (16, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (16, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (16, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (16, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (16, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (16, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (17, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (17, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (17, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (17, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价16', '2024-12-09 08:30:25'),
       (17, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (17, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (17, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价27', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价28', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价30', '2024-12-09 08:30:25'),
       (17, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (17, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (17, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (17, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (18, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (18, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (18, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (18, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价11', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (18, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (18, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (18, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (18, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价25', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (18, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价32', '2024-12-09 08:30:25'),
       (18, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (18, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价8', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价14', '2024-12-09 08:30:25'),
       (19, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (19, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (19, 1, 2, '评价19', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (19, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (19, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (19, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (19, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (20, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (20, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (20, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价4', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (20, 1, 1, '评价6', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (20, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (20, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价14', '2024-12-09 08:30:25'),
       (20, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (20, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (20, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (20, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (20, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (20, 1, 2, '评价23', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价24', '2024-12-09 08:30:25'),
       (20, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价27', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (20, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (20, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (20, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (20, 1, 4, '评价33', '2024-12-09 08:30:25'),
       (20, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价4', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价5', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价8', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (21, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (21, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (21, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (21, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (21, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (21, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (21, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价27', '2024-12-09 08:30:25'),
       (21, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (21, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (21, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (21, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (21, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (21, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价4', '2024-12-09 08:30:25'),
       (22, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (22, 1, 1, '评价6', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价8', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价9', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (22, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价19', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (22, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (22, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (22, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (22, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (23, 1, 4, '评价4', '2024-12-09 08:30:25'),
       (23, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (23, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价9', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价11', '2024-12-09 08:30:25'),
       (23, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (23, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (23, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (23, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (23, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (23, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (23, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (23, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (23, 1, 4, '评价25', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (23, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (23, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (23, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (23, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (23, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (24, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (24, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (24, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (24, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (24, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价13', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价14', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (24, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (24, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (24, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (24, 1, 2, '评价23', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (24, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (24, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (24, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (24, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (24, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (25, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (25, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价4', '2024-12-09 08:30:25'),
       (25, 1, 2, '评价5', '2024-12-09 08:30:25'),
       (25, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (25, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (25, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价14', '2024-12-09 08:30:25'),
       (25, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (25, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (25, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (25, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (25, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (25, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (25, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (25, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (25, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (25, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (25, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (25, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (26, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (26, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (26, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (26, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (26, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价13', '2024-12-09 08:30:25'),
       (26, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (26, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (26, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (26, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (26, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (26, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (26, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (26, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (26, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (26, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (26, 1, 1, '评价31', '2024-12-09 08:30:25'),
       (26, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (26, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (26, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (27, 1, 1, '评价3', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (27, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价7', '2024-12-09 08:30:25'),
       (27, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (27, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (27, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价19', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (27, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (27, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (27, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (27, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (27, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (27, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (27, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (27, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (27, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (28, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (28, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (28, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价11', '2024-12-09 08:30:25'),
       (28, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (28, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (28, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (28, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (28, 1, 4, '评价25', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价27', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (28, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (28, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (28, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (28, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (29, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (29, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (29, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (29, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (29, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (29, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (29, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (29, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (29, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (29, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (29, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (29, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (29, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (29, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (29, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (29, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (29, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (29, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价28', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (29, 1, 2, '评价30', '2024-12-09 08:30:25'),
       (29, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (29, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (29, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (30, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (30, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (30, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (30, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (30, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价11', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价14', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价16', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (30, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (30, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (30, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (30, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (30, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (30, 1, 5, '评价29', '2024-12-09 08:30:25'),
       (30, 1, 2, '评价30', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (30, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (30, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (30, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (31, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (31, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (31, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (31, 1, 4, '评价7', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (31, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (31, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (31, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价24', '2024-12-09 08:30:25'),
       (31, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (31, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (31, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (31, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价32', '2024-12-09 08:30:25'),
       (31, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (31, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (32, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价2', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (32, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (32, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价9', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (32, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (32, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (32, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (32, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (32, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (32, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价27', '2024-12-09 08:30:25'),
       (32, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (32, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (32, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (32, 1, 2, '评价31', '2024-12-09 08:30:25'),
       (32, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (32, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (32, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价1', '2024-12-09 08:30:25'),
       (33, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (33, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (33, 1, 1, '评价4', '2024-12-09 08:30:25'),
       (33, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (33, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (33, 1, 1, '评价14', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (33, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (33, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (33, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (33, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价27', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (33, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (33, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价32', '2024-12-09 08:30:25'),
       (33, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (33, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (34, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (34, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (34, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (34, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价13', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价19', '2024-12-09 08:30:25'),
       (34, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (34, 1, 4, '评价25', '2024-12-09 08:30:25'),
       (34, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价27', '2024-12-09 08:30:25'),
       (34, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (34, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (34, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (34, 1, 3, '评价34', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价4', '2024-12-09 08:30:25'),
       (35, 1, 2, '评价5', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价6', '2024-12-09 08:30:25'),
       (35, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价8', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价10', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价14', '2024-12-09 08:30:25'),
       (35, 1, 2, '评价15', '2024-12-09 08:30:25'),
       (35, 1, 3, '评价16', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (35, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (35, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (35, 1, 2, '评价23', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价28', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (35, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (35, 1, 2, '评价31', '2024-12-09 08:30:25'),
       (35, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (35, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (35, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (36, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价7', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (36, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价11', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (36, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (36, 1, 1, '评价17', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价18', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价19', '2024-12-09 08:30:25'),
       (36, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (36, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (36, 1, 1, '评价22', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (36, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价25', '2024-12-09 08:30:25'),
       (36, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (36, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价30', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (36, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (36, 1, 4, '评价33', '2024-12-09 08:30:25'),
       (36, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (37, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (37, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价4', '2024-12-09 08:30:25'),
       (37, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (37, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (37, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (37, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (37, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (37, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (37, 1, 1, '评价20', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (37, 1, 2, '评价23', '2024-12-09 08:30:25'),
       (37, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (37, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价26', '2024-12-09 08:30:25'),
       (37, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (37, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (37, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (37, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (37, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (37, 1, 4, '评价34', '2024-12-09 08:30:25'),
       (38, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (38, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (38, 1, 3, '评价6', '2024-12-09 08:30:25'),
       (38, 1, 2, '评价7', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价8', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价11', '2024-12-09 08:30:25'),
       (38, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价13', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (38, 1, 1, '评价15', '2024-12-09 08:30:25'),
       (38, 1, 2, '评价16', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (38, 1, 2, '评价19', '2024-12-09 08:30:25'),
       (38, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (38, 1, 2, '评价24', '2024-12-09 08:30:25'),
       (38, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (38, 1, 3, '评价26', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (38, 1, 5, '评价28', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (38, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (38, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (38, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (38, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (39, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (39, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (39, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (39, 1, 1, '评价5', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价6', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价8', '2024-12-09 08:30:25'),
       (39, 1, 4, '评价9', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (39, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价14', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价16', '2024-12-09 08:30:25'),
       (39, 1, 3, '评价17', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价18', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (39, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价22', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价23', '2024-12-09 08:30:25'),
       (39, 1, 1, '评价24', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价27', '2024-12-09 08:30:25'),
       (39, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (39, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (39, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (39, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (39, 1, 2, '评价32', '2024-12-09 08:30:25'),
       (39, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (39, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价1', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价3', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (40, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (40, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价8', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (40, 1, 1, '评价13', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价17', '2024-12-09 08:30:25'),
       (40, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价20', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价21', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价22', '2024-12-09 08:30:25'),
       (40, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (40, 1, 5, '评价24', '2024-12-09 08:30:25'),
       (40, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (40, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (40, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (40, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (40, 1, 3, '评价33', '2024-12-09 08:30:25'),
       (40, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价1', '2024-12-09 08:30:25'),
       (41, 1, 4, '评价2', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (41, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价7', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (41, 1, 5, '评价9', '2024-12-09 08:30:25'),
       (41, 1, 4, '评价10', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价12', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (41, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (41, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (41, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价18', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价19', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价20', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价21', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (41, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (41, 1, 5, '评价24', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价26', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (41, 1, 4, '评价28', '2024-12-09 08:30:25'),
       (41, 1, 3, '评价29', '2024-12-09 08:30:25'),
       (41, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价31', '2024-12-09 08:30:25'),
       (41, 1, 1, '评价32', '2024-12-09 08:30:25'),
       (41, 1, 5, '评价33', '2024-12-09 08:30:25'),
       (41, 1, 2, '评价34', '2024-12-09 08:30:25'),
       (42, 1, 2, '评价1', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价4', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价5', '2024-12-09 08:30:25'),
       (42, 1, 1, '评价6', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (42, 1, 2, '评价9', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价10', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (42, 1, 2, '评价12', '2024-12-09 08:30:25'),
       (42, 1, 2, '评价13', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价14', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价20', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价25', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价27', '2024-12-09 08:30:25'),
       (42, 1, 3, '评价28', '2024-12-09 08:30:25'),
       (42, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价30', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (42, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (42, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (42, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价1', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价2', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价3', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价4', '2024-12-09 08:30:25'),
       (43, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价7', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价8', '2024-12-09 08:30:25'),
       (43, 1, 2, '评价9', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价10', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价12', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价13', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价14', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价15', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价16', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (43, 1, 3, '评价18', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (43, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价21', '2024-12-09 08:30:25'),
       (43, 1, 2, '评价22', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价23', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价24', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价26', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价28', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价29', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价30', '2024-12-09 08:30:25'),
       (43, 1, 5, '评价31', '2024-12-09 08:30:25'),
       (43, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (43, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (43, 1, 1, '评价34', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价1', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价2', '2024-12-09 08:30:25'),
       (44, 1, 2, '评价3', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价4', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价5', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价6', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价8', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价10', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价11', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价12', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (44, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价15', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价16', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价17', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价19', '2024-12-09 08:30:25'),
       (44, 1, 1, '评价20', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价21', '2024-12-09 08:30:25'),
       (44, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (44, 1, 1, '评价23', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价24', '2024-12-09 08:30:25'),
       (44, 1, 1, '评价25', '2024-12-09 08:30:25'),
       (44, 1, 2, '评价26', '2024-12-09 08:30:25'),
       (44, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (44, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (44, 1, 1, '评价29', '2024-12-09 08:30:25'),
       (44, 1, 1, '评价30', '2024-12-09 08:30:25'),
       (44, 1, 4, '评价31', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价32', '2024-12-09 08:30:25'),
       (44, 1, 2, '评价33', '2024-12-09 08:30:25'),
       (44, 1, 5, '评价34', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价1', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价2', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价3', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价4', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价5', '2024-12-09 08:30:25'),
       (45, 1, 5, '评价6', '2024-12-09 08:30:25'),
       (45, 1, 5, '评价7', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价8', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价9', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价10', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价11', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价12', '2024-12-09 08:30:25'),
       (45, 1, 5, '评价13', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价14', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价15', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价16', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价17', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价18', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价19', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价20', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价21', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价22', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价23', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价24', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价25', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价26', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价27', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价28', '2024-12-09 08:30:25'),
       (45, 1, 2, '评价29', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价30', '2024-12-09 08:30:25'),
       (45, 1, 3, '评价31', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价32', '2024-12-09 08:30:25'),
       (45, 1, 1, '评价33', '2024-12-09 08:30:25'),
       (45, 1, 4, '评价34', '2024-12-09 08:30:25');