### Developed with
    * MacOS
    * Rails 6.1.3.1
    * yarn
    * pg

## Setting up
    * `git clone https://github.com/Aldeano17/my-books.git`
    * `cd my_api`
    * `yarn install`
    * If not have it will need to install pg or edit the database.yml to take your db of preference
    * `bundle install`
    * `rails db:create`
    * `rails db:migrate`

## Books routes
    http://localhost:3000/books => list all books
    http://localhost:3000/books/:id => get book by id
    
