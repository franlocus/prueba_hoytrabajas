# README

# Ruby Info

Ruby version: ruby 3.1.2p20
Rails version: 7.0.4

# Steps to reproduce


## Clone repo
git clone https://github.com/franlocus/prueba_hoytrabajas

# Docker
## Initial setup
```
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:setup
docker compose run --rm web bin/rails db:seed
```
## Running the Rails app
```
docker compose up
```
# Local
## Install dependencies

bundle install

## Create and migrate database

rails db:create

rails db:migrate

## Populate database with demo data

rails db:seed

> Demo users info:

> 1. email: user@email.com
  password: 123456
 
## Run tests

rspec
## Boot server

./bin/dev