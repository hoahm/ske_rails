# README

This is a skeleton for new Rails project, which includes:

 - Slim template engine.
 - User management.
 - Dynamic roles and permissions.
 - Custom fields.
 - Activities log.
 - Manage modules.
 - Multi-tenancy based on domain name.
 - Multi-localization.

* [Directory Structures](#directory-structures)
* [Architecture](#architecture)
* [Database schema][#database-schema]
* [System Dependencies](#system-dependencies)
* [3rd party services](#3rd-party-services)
* [Configurations](#configurations)
* [Services](#services)
* [Development dependencies](#development-dependencies)
* [Development & testing](#Development-&-testing)
* [Deployment instructions](#deployment-instructions)

# Directory Structures

    application/
      |- app/
      |  |- assets/
      |  |  |- images/
      |  |  |- javascripts/
      |  |  |  |- application.js
      |  |  |- stylesheets/
      |  |  |  |- application.css
      |  |- channels/
      |  |- controllers/
      |  |  |- api/
      |  |  |- application_controller.rb
      |  |- decorators
      |  |- enums/
      |  |- helpers/
      |  |- jobs/
      |  |- mailers/
      |  |- models/
      |  |- services/
      |  |- validators/
      |  |- views/
      |  |  |- layouts/
      |  |  |  |- application.html.slim
      |  |  |  |- blank.html.slim
      |- bin/
      |- config/
      |  |- environments/
      |  |- initializers/
      |  |- locales/
      |  |  |- en.yml
      |  |- database,yml
      |  |- routes.rb
      |- db/
      |  |- schema.rb
      |  |- seeds.rb
      |- lib/
      |- log/
      |- public/
      |- spec/
      |  |- rails_helper.rb
      |  |- spec_helper.rb
      |- tmp/
      |- vendor/
      |- .env
      |- config.ru
      |- package.json
      |- config.ru
      |- Gemfile
      |- Gemfile.lock
      |- Guardfile
      |- Rakefile
      |- README.md

# Architecture

  - Multiple tenant Software as a Service (SaaS) architecture.

# Database schema
 
![Entity Relationship Diagram](./erd.jpeg)

# System Dependencies

- **Ruby 2.4.1p111**
- **Rails 5.0.4**
- **PostgreSQL 9.6.5**

# 3rd party services
 
- **[http://localeapp.com](http://localeapp.com)**
  + Translation service

# Configurations

Set environment variables or put variables in ./.env file.

    # Run `bundle exec rake secret` to generate secret key base
    SECRET_KEY_BASE=

    RAILS_MAX_THREADS=25
    DATABASE_HOST=localhost
    DATABASE_NAME=
    DATABASE_USERNAME=
    DATABASE_PASSWORD=

    RAILS_ENV=<environment>

# Services

    T.B.D

# Development dependencies

    - yarn

# Development & testing

Check Ruby style:

    rubocop

Check quality of your code:

    bundle exec rails_best_practices -d .

Run test:
​
    bundle exec rspec

Automatically run your specs when files are modified

    bundle exec guard

Check Ruby on Rails vulnerabilities:
​
    bundle exec brakeman

Generating documentation

    yard doc

Add a comment summarizing the current schema to models,..
​
    annotate --exclude tests,fixtures,factories

Generate Entity Relationship Diagram (./erd.pdf)

    bundle exec erd    

# Deployment instructions

T.B.D
