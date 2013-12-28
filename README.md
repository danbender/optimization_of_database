# Welcome to KarmaVille

A pre-built Rails application with two models: `User` and `KarmaPoint`. After seeding the database with data, you'll have 100,000 rows in the `users` table and 1,500,000 rows in the `karma_points` table. The index page is sl-o-o-ow and it's your job to speed it up without using any fancy technologies like memcache, redis, or Rails' fragment caching.


## Getting Started

KarmaVille uses [PostgreSQL](http://www.postgresql.org/).  Run the following commands to get started:

```text
$ git clone git://github.com/Devbootcamp/karmaville.git
$ cd karmaville
$ bundle install
$ rake db:setup
```

The `rake db:setup` command could take several minutes to run.


## Result

The index page loads in about 35 ms.