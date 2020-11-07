# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

2.7.2

* Rails version

6.0.3

* System dependencies

* Configuration

`docker-compose build`

`docker-compose run --rm api_rails bundle install`

`docker-compose run api_rails rails webpacker:install`

`docker-compose up -d api_rails`

Do not run (this was used in the app creation)
```
docker-compose run --no-deps api_rails rails new . --force --database=postgresql
```

Any other command
`docker-compose run api_rails [command]`

Start rails console
```
docker-compose run api_rails rails console
```

Run rspec
```
docker-compose run api_rails rspec
```

Tail rails server log
```
docker-compose run api_rails tail log/development.log
```

Generates
```
docker-compose run api_rails rails generate active_admin:install
```

* Database creation

`docker-compose run api_rails rails db:create`

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
