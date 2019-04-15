# README

## Overview

A web application for conducting monthly MVP surveys.

## Installation/Setup

### Environment

See [Setting up Ruby on Rails Guide via Homebrew](https://gorails.com/setup/osx/10.12-sierra)
* Ruby 2.5.0
* Rails 5.2.0
* PostgreSQL 10.3

```
git clone https://github.com/kaylaziegler/mvp-survey.git
cd mvp-survey
bundle install
cp config/database.yml-dist config/database.yml
bundle exec rails db:setup
```

### Secrets
Secrets are encrypted in `credentials.yml.enc`. Obtain the master key and place the key under `config/` in a new file called `master.key`. You will need this key to run the server locally and to run tests.

To edit secrets:

    EDITOR=vi rails credentials:edit

## Development

### Run Tests

To run all tests:

```
TBD
```

### Local Server

To start the server for local development:

```
bundle exec rails s -p 3000
```
