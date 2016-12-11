# Bookstore

A simple application showing how to use Swift-Kuery

## Getting started

1. Requires PostgreSQL and PostgreSQL client library

On macOS: `brew install postgresql`
On Linux: `sudo apt-get install libpq-dev`

2. Create database

`createdb bookstoredb`

3. **Load the schema**

  Load psql: `psql -d bookstoredb`

  Load the schema: `\i Database/schema.sql`

4. **Compile**:

  `swift build`

5. **Run**:

  `.build/debug/Server`

6. **Test**:

  `curl localhost:8090`


## SQL queries

***Get cart data***

```sql
select * from books, carts where books.id=carts.book_id and user_id=1;
```

***Get books with authors***

```sql
select * from books, authors, book_author where books.book_id=book_author.book_id and authors.author_id=book_author.author_id;
```

## Running in Docker

  1. Build the image

  ```
  $ docker build -t bookstore .
  ```

  2. Run the image

  ```
  $ docker run --name bookstore -d -p 8090:8090 bookstore
  ```

## Deploying your Docker image


  ```
  $ cf create-service compose-for-postgresql Standard bookstore-postgresql
  ```

  Create a bridge

  ```
  cf push containerbridge -p containerbridge -i 1 -d mybluemix.net -k 1M -m 64M --no-hostname --no-manifest --no-route --no-start
  ```

  ```
  cf bind-service containerbridge bookstore-postgresql
  ```


  ```
  cf ic group update -e "CCS_BIND_APP=containerbridge" bookstore
  ```

  View the credentials

  ```
  cf ic group inspect bookstore
  ```
