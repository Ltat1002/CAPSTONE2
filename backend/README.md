* Ruby version: 3.2.0
* Rails version: 7.0.4

* Get start:

  - Setup:
    + bundle install (always run after pull code)

  - Database:
    + Add mysql password:
      - run: cp .env.example .env
    + Create database run: rails db:drop db:create db:migrate db:seed (only run 1 after pull code if db change)

  - Start server:
    + To start server (at localhost:3000) run: rails s
