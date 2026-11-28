USE BikeStores
GO
/*task1*/
BEGIN TRANSACTION;

UPDATE sales.customers
SET state = 'XX'
WHERE email LIKE '%yahoo%';
ROLLBACK;

/*task2*/


BEGIN TRANSACTION
UPDATE sales.customers
SET street='NOT AVAILABLE'
WHERE email='damian.dawson@hotmail.com' OR
      email='luis.tyler@gmail.com' OR email='casey.gill@gmail.com';
ROLLBACK ;



/*task3*/
BEGIN TRANSACTION;

DELETE FROM sales.customers
WHERE street LIKE '%St.%'
  AND city LIKE '% %';
ROLLBACK;

/*task5*/
SELECT *
FROM Sales
WHERE CustomerName LIKE 'Ali%'
  AND ProductCategory IN (
    'Electronics',
    'Furniture',
    'Office Supplies'
    )
  AND Country IN ('Azerbaijan', 'Turkey')
  AND OrderAmount > 1000;

