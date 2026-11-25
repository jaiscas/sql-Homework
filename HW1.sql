/* Homework1*/
USE BikeStores;
GO

/*  TASK 1*/
CREATE TABLE sales.payments(
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL ,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES sales.orders(order_id)
);

/*  TASK 2*/
ALTER TABLE sales.customers
ADD
    date_of_birth DATE,
    created_at DATETIME DEFAULT GETDATE();
/*  TASK 3*/
ALTER TABLE production.products
    ALTER COLUMN list_price DECIMAL(12,2);
/*  TASK 4*/
CREATE SCHEMA hr
    ALTER SCHEMA hr TRANSFER sales.staffs;
/*task58**?*/
ALTER TABLE sales.customers
    ALTER COLUMN zip_code VARCHAR(10);
/*task6*/
CREATE  TABLE hr.departments(
    department_id INT IDENTITY (1,1) PRIMARY KEY,
    department_name VARCHAR(50),
    created_date DATE
);
/*task7*/
DROP TABLE hr.departments;
/*task8*/
ALTER TABLE sales.customers
    DROP COLUMN date_of_birth;
/*dml*/
/*task!1*/
INSERT INTO sales.customers (
    first_name,
    last_name,
    email,
    city,
    state
)
VALUES (
           'Test',
           'Customer',
           'your-unique-email@example.com',
           'New York',
           'NY'
       );
/*task2*/
UPDATE production.products
SET list_price = list_price * 1.10
WHERE model_year = 2016;

/*task3*/
UPDATE production.products
SET list_price=list_price*1.05
WHERE product_name='Electra'

/*task4*/
DELETE FROM production.stocks

/*task5*/
DELETE FROM production.products
WHERE product_name='Electra' AND model_year=2016;

/*task6*/
INSERT INTO production.categories (category_name)
VALUES
    ('Hybrid Bikes'),
    ('Touring Bikes');

/*task7*/
UPDATE sales.customers
SET city='NewYork'
WHERE city='NY';
/*task8*/
DELETE FROM sales.stores
WHERE city='Baku';

/*task9*/
INSERT INTO sales.stores(store_name, phone, email, street, city, state, zip_code)
VALUES ('Neftchiler',0555108896,'csursx@gmail.com','xxxx','xxxx','texas',565665)

/*tcl*/
/*task1*/
    BEGIN TRANSACTION ;
INSERT INTO sales.stores(store_name, phone, email, street, city, state, zip_code)
VALUES ('Neftchiler',0555108896,'csursx@gmail.com','xxxx','xxxx','texas',565665)

    COMMIT;


/*task2*/
BEGIN TRANSACTION;

UPDATE production.products
SET list_price = list_price + 20
WHERE product_id IN (1, 2, 3);

COMMIT;
/*task3*/

BEGIN TRANSACTION;

DELETE FROM production.categories
WHERE category_name = 'Touring Bikes';

ROLLBACK;

SELECT *
FROM production.categories
WHERE category_name = 'Touring Bikes';

/*task4*/
BEGIN TRANSACTION;

UPDATE production.products
SET list_price = list_price + 10
WHERE product_id IN (1, 2);

UPDATE sales.customers
SET city = 'Temporary City'
WHERE customer_id IN (1, 2);

ROLLBACK;

SELECT * FROM sales.payments;