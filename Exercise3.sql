1. What is a data type? Give two examples.
   Data types define the type of value a column can hold such as numbers, text, or dates.
   a)DATETIME -  A data type is used to store both date and time in the record.
   eg; date_of_birth datetime
   b)VARCHAR - It is used to specify a variable length string that can contain numbers, letters, and special characters.
   eg; email varchar(35)

2. What is the purpose of constraints in a database?
   constraints are used to enforce rules on data, ensuring the accuracy, consistency, and integrity of the data stored in a database.

3. Define the PRIMARY KEY constraint.
   Primary key constraint prevents duplicate or NULL values in the specified column.
   eg; id int primary key auto_increment

4. What is the difference between CHAR and VARCHAR data types?
 char - It is used to specify a fixed length string that can contain numbers, letters, and special characters.
 varchar - It is used to specify a variable length string that can contain numbers, letters, and special characters.

5. Write a SQL query to select all authors from the Authors table.
   select * from authors;

6. What does the NOT NULL constraint do?
  NOT NULL constraint, which ensures that a column cannot have NULL values.

7. Write a SQL query to find all books published after January 1, 2020.
   select * from books where published_date > '01-01-2020';

8. Explain the purpose of the FOREIGN KEY constraint.
   This creates a relationship between the two tables.
   Ensuring that the relationship between tables is consistent and that invalid data does not enter the system.

9. Write a SQL query to count the number of books in the Books table.
   select count(*) as total_books from books;

10. What is the purpose of the CHECK constraint? Provide an example
   it is checking the values of certain columns in the table against certain conditions that you specify.
   age int check (age >= 18 and age <= 60)