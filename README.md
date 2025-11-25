# SpreeStorePickup

This is a Store Pickup extension for [Spree Commerce](https://spreecommerce.org), an open source e-commerce platform built with Ruby on Rails. Adds in-store pickup as selectable shipping and payment option during checkout.

[![Gem Version](https://badge.fury.io/rb/spree_store_pickup.svg)](https://badge.fury.io/rb/spree_store_pickup)

## Installation

1. Add this extension to your Gemfile:

    ```ruby
    bundle add spree_store_pickup
    ```

2. Install the migrations:

    ```bash
    bundle exec rake railties:install:migrations FROM=spree_store_pickup
    ```

3. Run the migrations:

    ```bash
    bundle exec rails db:migrate
    ```

4. Restart your server

## Developing

1. Create a dummy app:

    ```bash
    bundle update
    bundle exec rake test_app
    ```

2. Add code.

3. Run tests:

    ```bash
    bundle exec rspec
    ```

When testing your application's integration you may use its factories:

```ruby
require 'spree_store_pickup/factories'
```

## Testing

Generate the test app:

```bash
bundle exec rake test_app
```

Then run:

```bash
bundle exec rspec
```

## Releasing a new version

```bash
bundle exec gem bump -p -t
bundle exec gem release
```

For more options please see [gem-release README](https://github.com/svenfuchs/gem-release)

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2025 OlympusOne, released under the AGPL-3.0 or later.
