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


#UC4 -  Editing existing contact by first name

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
 | Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha        |  74855 |     751695  | pinkey@gmail.com  |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 4 rows in set (0.18 sec)


 #UC5 - Deleting contact using first name

 mysql> DELETE FROM Address_Book_Table WHERE FirstName = 'Sonu';
 Query OK, 1 row affected (0.20 sec)

 mysql> select * from Address_Book_Table;
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | FirstName | LastName | Address                 | City     | State       | Zip    | PhoneNumber | Email             |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | Piyu      | Kolpuke  | 45A, XYZ Colony         | Pune     | Maha        | 879465 |    21379847 | piyu@gmail.com    |
 | Aaroh     | Nelwad   | Amravati yashoda square | Amravati | Maharashtra |   7456 |     1258896 | aau@gmail.com     |
 | Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha        |  74855 |     751695  | pinkey@gmail.com  |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 3 rows in set (0.08 sec)


 #UC6 - ability to retrive person belonging to a city

 mysql> SELECT * FROM Address_Book_Table WHERE City = 'Pune';
 +-----------+----------+-----------------+--------+-------+--------+-------------+-----------------+
 | FirstName | LastName | Address         | City   | State | Zip    | PhoneNumber | Email           |
 +-----------+----------+-----------------+--------+-------+--------+-------------+-----------------+
 | Piyu      | Kolpuke  | 45A, XYZ Colony | Pune   | Maha  | 879465 |    21379847 | piyu@gmail.com  |
 +-----------+----------+-----------------+--------+-------+--------+-------------+-----------------+
 1 row in set (0.00 sec)



 #UC7 - Ability to get the size of the address book by the city

 mysql> SELECT COUNT(City) FROM Address_Book_Table;
 +-------------+
 | COUNT(City) |
 +-------------+
 |           3 |
 +-------------+
 1 row in set (0.07 sec)


#UC8 - Ability to retrieve entries in alphabetical order by First Name

 mysql> select * from Address_Book_Table;
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | FirstName | LastName | Address                 | City     | State       | Zip    | PhoneNumber | Email             |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | Piyu      | Kolpuke  | 45A, XYZ Colony         | Pune     | Maha        | 879465 |    21379847 | piyu@gmail.com    |
 | Aaroh     | Nelwad   | Amravati yashoda square | Amravati | Maha        |   7456 |     1258896 | aau@gmail.com     |
 | Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha        |  74855 |     751695  | pinkey@gmail.com  |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 3 rows in set (0.00 sec)

 mysql> select * from Address_Book_Table WHERE State = 'Maha' ORDER BY FirstName ASC;
 +-----------+----------+-------------------------+----------+-------+--------+-------------+-------------------+
 | FirstName | LastName | Address                 | City     | State | Zip    | PhoneNumber | Email             |
 +-----------+----------+-------------------------+----------+-------+--------+-------------+-------------------+
 | Aaroh     | Nelwad   | Amravati yashoda square | Amravati | Maha  |   7456 |  1258896    | aau@gmail.com     |
 | Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha  |  74855 |     751695  | pinkey@gmail.com  |
 | Piyu      | Kolpuke  | 45A, XYZ Colony         | Pune     | Maha  | 879465 |    21379847 | piyu@gmail.com    |
 +-----------+----------+-------------------------+----------+-------+--------+-------------+-------------------+
 3 rows in set (0.10 sec)


#UC9 - Ability to identify each Address Book with name and Type.

mysql> ALTER TABLE Address_Book_Table ADD Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY AFTER Email;
Query OK, 0 rows affected (6.47 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Address_Book_Table;
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | FirstName | LastName | Address                 | City     | State       | Zip    | PhoneNumber | Email             |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
 | Piyu      | Kolpuke  | 45A, XYZ Colony         | Pune     | Maha        | 879465 |    21379847 | piyu@gmail.com    |
 | Aaroh     | Nelwad   | Amravati yashoda square | Amravati | Maha        |   7456 |     1258896 | aau@gmail.com     |
 | Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha        |  74855 |     751695  | pinkey@gmail.com  |
 +-----------+----------+-------------------------+----------+-------------+--------+-------------+-------------------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE Address_Book_Table ADD Type VARCHAR(50) NOT NULL AFTER Id;
Query OK, 0 rows affected (0.36 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE Address_Book_Table SET Type = 'Family' WHERE Id = 1;
Query OK, 1 row affected (0.14 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Address_Book_Table SET Type = 'Family' WHERE Id = 2;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Address_Book_Table SET Type = 'Friend' WHERE Id = 3;
Query OK, 1 row affected (0.15 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Address_Book_Table;
+-----------+----------+-------------------------+----------+-------+--------+-------------+-------------------+----+--------+
| FirstName | LastName | Address                 | City     | State | Zip    | PhoneNumber | Email             | Id | Type   |
+-----------+----------+-------------------------+----------+-------+--------+-------------+-------------------+----+--------+
| Piyu     | Kolpuke   | 45A, XYZ Colony         | Pune     | Maha  | 879465 |    21379847 | piyu@gmail.com    |  1 | Family |
| Aaroh    | Nelwad    | Amravati yashoda square | Amravati | Maha  |   7456 |     1258896 | aaroh@gmail.com   |  2 | Family |
| Pinkey   | Hade      | 49A, XY Colony          | Mumbai   | Maha  |  74855 |      751695 | pinkey@gmail.com  |  3 | Friend |
+-----------+----------+-------------------------+----------+-------+--------+-------------+-------------------+----+--------+
3 rows in set (0.00 sec)

mysql>  insert into Address_Book_Table (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,Id,Type) values("Vilas","Naik","Pachgaon","Kolhapur","Maharashtra",'416500','9969999',"vikasnaik@gmail.com","4","Profession");
Query OK, 1 row affected (0.17 sec)

mysql> ALTER TABLE Address_Book_Table ADD (AddressBook VARCHAR(50) NOT NULL);
Query OK, 0 rows affected (2.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE  Address_Book_Table SET AddressBook = 'contact 1' WHERE Id = 1;
Query OK, 1 row affected (0.16 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE  Address_Book_Table SET AddressBook = 'contact 2' WHERE Id = 2;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE  Address_Book_Table SET AddressBook = 'contact 3' WHERE Id = 3;
Query OK, 1 row affected (0.15 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE  Address_Book_Table SET AddressBook = 'contact 4' WHERE Id = 4;
Query OK, 1 row affected (0.18 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Address_Book_Table;
+-----------+----------+-------------------------+----------+-------------+--------+-------------+---------------------+----+------------+-------------+
| FirstName | LastName | Address                 | City     | State       | Zip    | PhoneNumber | Email               | Id | Type       | AddressBook |
+-----------+----------+-------------------------+----------+-------------+--------+-------------+---------------------+----+------------+-------------+
| Piyu      | Kolpuke  | 45A, XYZ Colony         | Pune     | Maha        | 879465 |    21379847 | piyu@gmail.com      |  1 | Family     | contact 1   |
| Aaroh     | Nelwad   | Amravati yashoda square | Amravati | Maha        |   7456 |     1258896 | aaroh@gmail.com     |  2 | Family     | contact 2   |
| Pinkey    | Hade     | 49A, XY Colony          | Mumbai   | Maha        |  74855 |      751695 | pinkey@gmail.com    |  3 | Friend     | contact 3   |
| Vilas     | Naik     | Pachgaon                | Kolhapur | Maharashtra | 416500 |     9969999 | vikasnaik@gmail.com |  4 | Profession | contact 4   |
+-----------+----------+-------------------------+----------+-------------+--------+-------------+---------------------+----+------------+-------------+
4 rows in set (0.00 sec)


#UC10 count by type.

mysql> SELECT Type, COUNT(FirstName) FROM Address_Book_Table GROUP BY Type;
+------------+------------------+
| Type       | COUNT(FirstName) |
+------------+------------------+
| Family     |                2 |
| Friend     |                1 |
| Profession |                1 |
+------------+------------------+
3 rows in set (0.08 sec)


#UC11 - Ability to add person to both Friend and Family

mysql> insert into Address_Book_Table (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,Id,type,AddressBook) values("Anuj", "Hade", "49A, XY Colony", "Betul", "Maha", '74855', '751695', "anuj@gmail.com", '5', "Family", "contact5");
Query OK, 1 row affected (0.11 sec)

mysql> select * from Address_Book_Table;
+-----------+----------+-------------------------+----------+-------------+--------+-------------+---------------------+----+------------+-------------+
| FirstName | LastName | Address                 | City     | State       | Zip    | PhoneNumber | Email               | Id | Type       | AddressBook |
+-----------+----------+-------------------------+----------+-------------+--------+-------------+---------------------+----+------------+-------------+
| Piyu     | Kolpuke   | 45A, XYZ Colony         | Pune     | Maha        | 879465 |    21379847 | piyu@gmail.com      |  1 | Family     | contact 1   |
| Aaroh    | Nelwad    | Amravati yashoda square | Amravati | Maha        |   7456 |     1258896 | aaroh@gmail.com     |  2 | Family     | contact 2   |
| Pinkey   | Hade      | 49A, XY Colony          | Mumbai   | Maha        |  74855 |      751695 | pinkey@gmail.com    |  3 | Friend     | contact 3   |
| Vilas    | Naik      | Pachgaon                | Kolhapur | Maharashtra | 416500 |     9969999 | vikasnaik@gmail.com |  4 | Profession | contact 4   |
| Anuj     | Hade      | 49A, XY Colony          | Betul    | Maha        |  74855 |      751695 | anuj@gmail.com      |  5 | Family     | contact 5   |
+-----------+----------+-------------------------+----------+-------------+--------+-------------+---------------------+----+------------+-------------+
5 rows in set (0.00 sec)


#UC12 - Draw the ER Diagram for Address Book Service DB

mysql> CREATE TABLE People(
    -> PersonId int primary key not null,
    -> FirstName varchar(20) not null,
    -> LastName varchar(20) not null,
    -> PhoneNumber numeric(10),
    -> Email VARCHAR(50)
    -> );
Query OK, 0 rows affected (1.55 sec)

mysql> CREATE TABLE Address(
    -> PersonId int,
    -> Person_Address varchar(50) not null,
    -> City varchar(15) not null,
    -> State varchar(20) not null,
    -> Zip_Code numeric(6) not null,
    -> FOREIGN KEY (PersonId) REFERENCES People(PersonId)
    -> );
Query OK, 0 rows affected (0.89 sec)

mysql> CREATE TABLE AddressBook(
    -> PersonId int,
    -> AddressBookName varchar(20) not null,
    -> AddressBookType varchar(20) not null,
    -> FOREIGN KEY (PersonId) REFERENCES People(PersonId)
    -> );
Query OK, 0 rows affected (0.57 sec)


//UC13
         #Refactor uc6
mysql> SELECT FirstName,LastName,City
    -> FROM Address INNER JOIN People
    -> ON Address.PersonId = People.PersonId
    -> WHERE City = 'Amravati';
+-----------+----------+----------+
| FirstName | LastName | City     |
+-----------+----------+----------+
| Aaroh     | Nelwad   | Amravati |
+-----------+----------+----------+
1 row in set (0.03 sec)

mysql> SELECT FirstName,LastName,State
    -> FROM Address INNER JOIN People
    -> ON Address.PersonId = People.PersonId
    -> WHERE State = 'Maha';
+-----------+----------+-------+
| FirstName | LastName | State |
+-----------+----------+-------+
| Piyu      | Kolpuke  | Maha  |
| Aaroh     | Nelwad   | Maha  |
| Samay     | Raina    | Maha  |
| Tanmay    | Bhat     | Maha  |
+-----------+----------+-------+
4 rows in set (0.00 sec)

	#Refactor uc7
mysql> SELECT COUNT(City),City
    -> FROM Address INNER JOIN People
    -> ON Address.PersonId = People.PersonId
    -> WHERE City = 'Pune'
    -> GROUP BY City;
+-------------+------+
| COUNT(City) | City |
+-------------+------+
|           1 | Pune |
+-------------+------+
1 row in set (0.12 sec)

mysql> SELECT COUNT(State),State
    -> FROM Address INNER JOIN People
    -> ON Address.PersonId = People.PersonId
    -> WHERE State = 'Maha'
    -> GROUP BY State;
+--------------+-------+
| COUNT(State) | State |
+--------------+-------+
|            4 | Maha  |
+--------------+-------+
1 row in set (0.00 sec)

	#Refactor uc8
mysql> SELECT * FROM People INNER JOIN Address
    -> ON Address.PersonId = People.PersonId
    -> WHERE State = 'Maha'
    -> ORDER BY FirstName ASC;
+----------+-----------+----------+-------------+------------------+----------+-----------------+----------+-------+----------+
| PersonId | FirstName | LastName | PhoneNumber | Email            | PersonId | Person_Address  | City     | State | Zip_Code |
+----------+-----------+----------+-------------+------------------+----------+-----------------+----------+-------+----------+
|        3 | Aaroh     | Nelwad   |  9999999999 | Aaroh@gmail.com  |        3 | 87B, XY Colony  | Amravati | Maha  |   852147 |
|        1 | Piyu      | Kolpuke  |  7777777777 | piyu@gmail.com   |        1 | 45A, XYZ Colony | pune     | Maha  |   879465 |
|        4 | Samay     | Raina    |  4444444444 | Samay@gmail.com  |        4 | 83B, Y Colony   | Nagpur   | Maha  |   456369 |
|        5 | Tanmay    | Bhat     |  5555555555 | Tanmay@gmail.com |        5 | 81B, P Colony   | Mumbai   | Maha  |   854967 |
+----------+-----------+----------+-------------+------------------+----------+-----------------+----------+-------+----------+
4 rows in set (0.00 sec)

	#Refactor uc10
mysql> SELECT COUNT(AddressBookType),AddressBookType
    -> FROM AddressBook INNER JOIN People
    -> ON AddressBook.PersonId = People.PersonId
    -> WHERE AddressBookType = 'Friend'
    -> GROUP BY AddressBookType;
+------------------------+-----------------+
| COUNT(AddressBookType) | AddressBookType |
+------------------------+-----------------+
|                      2 | Friend          |
+------------------------+-----------------+
1 row in set (0.00 sec)
