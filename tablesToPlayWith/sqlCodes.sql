#to select a cities from a certain table

SELECT city FROM customers;

#to select a bunch of cities from the table without a repeated city

SELECT DISTINCT city FROM customers;

# now to show what the content of the database is you show do 

SHOW COLUMNS FROM customers;

# to select several fields from a table and display them

SELECT city, name, id FROM customers;

#if you want to select people based on id and adding a limit to it

SELECT city FROM customers limit "number to start", "number to stop";

# you can use class based operation by using the . operating

SELECT customers.city FROM customers;

# to make a sorted selection and easy to read, you do:

SELECT customers.id, customers.name, customers.address FROM customers ORDER BY name;

#for assending order or descending order, you can add on to each query DESC or ASC

SELECT customers.id, customers.name, customers.address FROM customers ORDER BY name ASC || DESC;

# retrieving the last ID inserted in the database

SELECT customers.id FROM customers ORDER BY customers.id DESC LIMIT 1;

#Basic filterinig 

SELECT customers.id, customers.name, customers.address FROM customers where customers.id = 3;

# remember that the . operator is used for accessing classes, and also more advance
# selection can be done by doing this

SELECT name, state, city FROM customers WHERE state="CA" AND city="Hollywood";
SELECT name, state, city FROM customers WHERE state="CA" OR city="Hollywood";

#these will be use for the first project and also what we will do for this content.
#other contents 

