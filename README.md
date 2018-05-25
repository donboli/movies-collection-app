# movie-collection-app

> This is a simple app that manages picture-based movie collections for multiple users. <br>It is built with [Ruby on Rails](https://rubyonrails.org/) + [Semantic UI](https://semantic-ui.com/) and uses server side rendering.

## Installation

1. Install the [Ruby](https://www.ruby-lang.org/en/) version specified in the .ruby-version file.<br/>A recommended way to do this is through [rbenv](https://github.com/rbenv/rbenv).
2. `gem install bundler`.
2. Run `bundle` in the root project directory.
3. Install and run [PostgreSQL](https://www.postgresql.org/).
4. Set up the database by running `rake db:create db:migrate`.

## Run it

1. Start the server by running `rails s`.
2. In your browser, navigate to http://localhost:3000.

## Test

Run all tests via `rspec`.

To automatically run the specs while developing:
1. Use `bundle exec guard`.
2. Then execute `rspec` within the Guard REPL.

## TODOs

- Style authentication pages.
- Extract text into i18n translation files.
- Properly style error messages.
- Add view specs for authentication pages.