DROP TABLE orders;
DROP TABLE users;
DROP TABLE book_author;
DROP TABLE books;
DROP TABLE authors;


CREATE TABLE books (
    id      INT PRIMARY KEY,
    title   VARCHAR(1024),
    ISBN    VARCHAR(128),
    year    INT
);

CREATE TABLE authors (
    id      INT PRIMARY KEY,
    name    VARCHAR(512)
);

CREATE TABLE book_author (
    book_id     INT REFERENCES books,
    author_id   INT REFERENCES authors 
);

CREATE TABLE users (
    id          INT PRIMARY KEY, 
    first_name  VARCHAR(512),
    last_name   VARCHAR(512)
);

CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    user_id      INT REFERENCES users,
    book_id      INT REFERENCES books,
    quantity     INT  
);

INSERT INTO books (id, title, ISBN, year) VALUES (1, 'A Game of Thrones', '978-0553593716', 2003);
INSERT INTO books (id, title, ISBN, year) VALUES (2, 'A Clash of Kings', '978-0553593716', 2003);
INSERT INTO books (id, title, ISBN, year) VALUES (3, 'A Storm of Swords', '034554398X', 2003);
INSERT INTO books (id, title, ISBN, year) VALUES (4, 'Harry Potter and the Sorcerer''s Stone', '0439708184', 1999);

INSERT INTO authors (id, name) VALUES (1, 'George R. R. Martin');
INSERT INTO authors (id, name) VALUES (2, 'J.K. Rowling');

INSERT INTO book_author (book_id, author_id) VALUES (1, 1);
INSERT INTO book_author (book_id, author_id) VALUES (2, 1);
INSERT INTO book_author (book_id, author_id) VALUES (3, 1);
INSERT INTO book_author (book_id, author_id) VALUES (4, 2);

INSERT INTO users (id, first_name, last_name) VALUES (1, 'Robert', 'Dickerson');

INSERT INTO orders (order_id, user_id, book_id, quantity) VALUES (1, 1, 1, 1);