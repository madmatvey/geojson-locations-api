# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

ruby '2.5.0'
rails '6.0.0'

* System dependencies

* Configuration

PostgreSQL. Versions 9.3 and up are supported.

Install the pg driver:
   `gem install pg`
On macOS with Homebrew:
   `gem install pg -- --with-pg-config=/usr/local/bin/pg_config`
On macOS with MacPorts:
   `gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config`
On Windows:
   `gem install pg`
       Choose the win32 build.
       Install PostgreSQL and put its /bin directory on your path.

Configure Using Gemfile
`gem 'pg'`

* Database creation

`rails db:setup`

* Database initialization

`rails dm:migrate`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
