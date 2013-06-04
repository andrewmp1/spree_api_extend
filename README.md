SpreeApiExtend
==============

A couple quick additional methods on the api to better support JS MVC frontends.

- Create users (don't have to be an admin) @ /api/users. Returns api key in response
- Login users via POST /api/sessions w/ json: "{ session: {email: "email", password: "password"}}"". returns api key in response.
- Get current order & user @ "/api/status"
- get /api/orders w/ a logged in 'non-admin' user will return all orders belonging to that user.

CAUTION
------------
These modifications are changing the default spree authorization for the api that could introduce security issues.  Be sure you look through the changes before you do anything productiony!

Installation
------------

Add spree_api_extend to your Gemfile:

```ruby
gem 'spree_api_extend'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_api_extend:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_api_extend/factories'
```

Copyright (c) 2013 Drew Purdy, released under the New BSD License
