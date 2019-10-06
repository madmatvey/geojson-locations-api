# GeoJSON with Rails PostgreSQL and PostGIS 📐🌍🔍

## API-only Ruby on Rails app.

The goal of the application is to determine whether an incoming geographical Location is inside at least one of the given areas.

### API endpoints

`GET /api/v1/areas` fetch list of the given areas in GeoJSON format

### Setup environment

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


### Setup project
```
$ bundle
$ rails db:create
$ rails db:gis:setup
$ rails db:migrate
$ rails db:seed
```

### To run app in development

```
$ overmind start
```

And open url: [localhost:3333](http://localhost:3333)


### To run the test suite

```
$ bundle exec rspec
```

* Deployment instructions
