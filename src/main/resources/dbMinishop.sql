create table POSITIONM(
id int  AUTO_INCREMENT,
name varchar(30) CHARACTER SET utf8,
primary key (id)
);
create table EMPLOYEE(
id int auto_increment,
name varchar(30) CHARACTER SET utf8,
address varchar(200) CHARACTER SET utf8,
gender bit,
identification char(14),
idPosition int,
email varchar(30),
username varchar(30),
password varchar(30),
primary key(id),
constraint FK_EMPLOYEE_POSITION foreign key(idPosition) references POSITIONM(positionm_id)
);
create table CATEGORY(
id int auto_increment,
name varchar(30) CHARACTER SET utf8,
image text,
primary key(id)
);
create table PRODUCT(
id int auto_increment,
idCategory int,
name varchar(30) CHARACTER SET utf8,
price varchar(50),
description text,
image text,
primary key(id),
constraint FK_PRODUCT_CATEGORY foreign key(idCategory) references CATEGORY(category_id)
);
create table COLOR(
id int auto_increment,
name varchar(30) CHARACTER SET utf8,
primary key(id)
);
create table SIZE(
id int auto_increment,
name varchar(30) CHARACTER SET utf8,
primary key(id)
);
create table DETAILPRODUCT(
id int auto_increment,
idProduct int,
idSize int,
idColor int,
amount int,
dayOfEntry varchar(50),
primary key(id),
constraint FK_DETAILPRODUCT_PRODUCT foreign key(idProduct) references PRODUCT(product_id),
constraint FK_DETAILPRODUCT_SIZE foreign key(idSize) references SIZE(size_id),
constraint FK_DETAILPRODUCT_COLOR foreign key(idColor) references COLOR(color_id)
);
create table PROMOTION(
id int auto_increment,
name varchar(100) CHARACTER SET utf8,
startTime varchar(50),
endTime varchar(50),
description text,
form text,
discount int,
primary key(id)
);
create table DETAILPROMOTION(
idPromotion int,
idProduct int,
primary key(idProduct, idPromotion),
constraint FK_DETAILPROMOTION_PROMOTION foreign key(idPromotion) references PROMOTION(promotion_id),
constraint FK_DETAILPROMOTION_PRODUCT foreign key(idProduct) references PRODUCT(product_id)
);
create table INVOICE(
id int auto_increment,
nameCustomer varchar(30) CHARACTER SET utf8,
phoneNumber char(12),
addreddDelivery varchar(200) CHARACTER SET utf8,
status bit,
dateCreate varchar(50),
primary key(id)
);
create table DETAILINVOICE(
idInvoice int,
idDetaiProduct int,
amount int,
totalPrice varchar(100),
primary key(idInvoice, idDetaiProduct),
constraint FK_DETAILINVOICE_INVOICE foreign key(idInvoice) references INVOICE(invoice_id),
constraint FK_DETAILINVOICE_DETAILPRODUCT foreign key(idDetaiProduct) references DETAILPRODUCT(detail_product_id)
);