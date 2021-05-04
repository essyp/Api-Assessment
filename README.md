
## Project Setup

This assessment was done using "laravel" and "vue js".

1. run this command "cp .env.example .env" to create  .env file and "php artisan key:generate" to generate key for the project

2. Set up your database in the .env file

3. run migration using "php artisan migrate"

4. run "npm install" and "npm run dev"

5. Start the project by running "php artisan serve"

## End Points

- "/api/v1/books" to fetch the books from the local database. The request is "GET"

- "/api/v1/books/{id}" to fetch a specific book from the local database. The request is "GET"

- "/api/v1/books" to create a new book in the local database. The request is "POST"

- "/api/v1/books/{id}" to update book in the local database. The request is "PATCH"

- "/api/v1/books/{id}" to delete book from the local database. The request is "DELETE"

- "/api/external-books" to fetch data from external api "https://www.anapioficeandfire.com/api/books" . The request is "GET"
- "/api/external-books" to fetch single data from external api "https://www.anapioficeandfire.com/api/books?name=A Game of Thrones" . The request is "GET"

There is also an attached sql file that you can use to populate the database.

