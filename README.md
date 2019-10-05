# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- **Ruby 2.5.0**

   It is recommended to use [rbenv](https://github.com/rbenv/rbenv) with [ruby-build](https://github.com/rbenv/ruby-build) and then run

   `$ rbenv install 2.5.0`

- **Bundler**

  `$ gem install bundler`
- **[Overmind](https://github.com/DarthSim/overmind)** to run processes from Procfile in dev.

  ```
  $ brew install tmux
  $ brew install overmind
  ```

- **Postgres 9.6 and Postgis 2.5**
  [install with Clover Health's Homebrew Tap](https://github.com/CloverHealth/homebrew-tap#installing-postgres-96-and-postgis-25)

* System dependencies

* Configuration

### Setup project
```
$ bundle
$ rails db:create
$ rails db:migrate
```

### To run app in development

Run:

```
$ overmind start
```

And open url: [localhost:3333](http://localhost:3333)

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
