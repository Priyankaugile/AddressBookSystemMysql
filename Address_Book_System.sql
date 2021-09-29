***********************************************************
      ********"Welcome to mysql database"********

#UC1 - Creating Database

mysql> CREATE DATABASE AddressBookService;
Query OK, 1 row affected (0.76 sec)

mysql> use AddressBookService
Database changed


#UC2 - Creating Address Book Table

mysql> CREATE TABLE Address_Book_Table
    -> (FirstName VARCHAR(150) NOT NULL,
    -> LastName VARCHAR(150) NOT NULL,
    -> Address VARCHAR(150) NOT NULL,
    -> City VARCHAR(150) NOT NULL,
    -> State VARCHAR(150) NOT NULL,
    -> Zip INT NOT NULL,
    -> PhoneNumber INT NOT NULL,
    -> Email VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (1.85 sec)

mysql> DESCRIBE Address_book_Table;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| FirstName   | varchar(150) | NO   |     | NULL    |       |
| LastName    | varchar(150) | NO   |     | NULL    |       |
| Address     | varchar(150) | NO   |     | NULL    |       |
| City        | varchar(100) | NO   |     | NULL    |       |
| State       | varchar(100) | NO   |     | NULL    |       |
| Zip         | int          | NO   |     | NULL    |       |
| PhoneNumber | int          | NO   |     | NULL    |       |
| Email       | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.73 sec)


#UC3 - Adding Contacts

mysql> INSERT INTO Address_Book_Table VALUES
    -> ('Piyu', 'Kolpuke', '36B, XYZ Colony','Pune','Maha', 879465, 21379847, 'piyu@gmail.com'),
    -> ('Aaroh', 'Nelwad', 'XZ Colony','Amravati','Maha', 879478,1258896, 'aaroh@gmail.com'),
    -> ('Sonu', 'Chame', '45b, XYZ Colony','goa','yxt', 74665, 3774814, 'sonu@gmail.com'),
    -> ('pinkey', 'Hade', '49A, XY Colony','Mumbai','Maha', 74855, 751695, 'pinkey@gmail.com');
Query OK, 4 rows affected (0.32 sec)
Records: 4  Duplicates: 0  Warnings: 0


#UC4 Editing existing contact by first name

 mysql> UPDATE Address_Book_Table
     -> SET Address = 'Amravati yashoda square', State ='Maharashtra', Zip = '7456', Email = 'aau@gmail.com'
     -> WHERE FirstName = 'Aaroh';
 Query OK, 1 row affected (0.04 sec)
 Rows matched: 1  Changed: 1  Warnings: 0

 mysql> select * from Address_Book_Table;
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | FirstName | LastName | Address                 | City     | State       | Zip    | PhoneNumber | Email             |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | Piyu      | Kolpuke  | 45A, XYZ Colony         | Pune     | Maha        | 879465 |    21379847 | piyu@gmail.com    |
 | Aaroh     | Nelwad   | Amravati yashoda square | Amravati | Maharashtra |   7456 |     1258896 | aau@gmail.com     |
 | Sonu      | Chame    | 45b, XYZ Colony         | goa      | yxt         |  74665 |     3774814 | sonu@gmail.com    |
 | Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha        |  74855 |     751695  | pinkey@gmail.com    |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 4 rows in set (0.18 sec)