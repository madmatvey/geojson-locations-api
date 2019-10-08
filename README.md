# GeoJSON with Rails PostgreSQL and PostGIS 📐🌍🔍

## API-only Ruby on Rails app.

The goal of the application is to determine whether an incoming geographical Location is inside at least one of the given areas.

### Source code

[github.com/madmatvey/geojson-locations-api](https://github.com/madmatvey/geojson-locations-api)

### Code status

[![CircleCI](https://circleci.com/gh/madmatvey/geojson-locations-api/tree/master.svg?style=svg&circle-token=096539165698bd02eda4714a1beea5b468e12131)](https://circleci.com/gh/madmatvey/geojson-locations-api/tree/master) [![Coverage Status](https://coveralls.io/repos/github/madmatvey/geojson-locations-api/badge.svg?branch=master)](https://coveralls.io/github/madmatvey/geojson-locations-api?branch=master)

### API endpoints

`GET /api/v1/areas` fetch list of the given areas in GeoJSON format

`POST /api/v1/locations` create a location
      IN: location name (text)
      OUT: ID of created location

`GET /api/v1/locations/:id` fetch location by ID
      IN: Location ID
      OUT: Location name, coordinates, inside? (true/false)

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

### Deployment instructions

Application will [deploy to Heroku with CircleCI](https://circleci.com/docs/2.0/deployment-integrations/#heroku) automaticaly when all RSpec tests are green and code coverage 100% in master branch.

Forks can setup Heroku manually and deploy with:

```
$ git push heroku master
```
