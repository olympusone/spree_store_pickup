# Spree Store Pickup

This is a Store Pickup extension for [Spree Commerce](https://spreecommerce.org), an open source e-commerce platform built with Ruby on Rails. Adds in-store pickup as selectable shipping and payment method during checkout.

[![Gem Version](https://badge.fury.io/rb/spree_store_pickup.svg)](https://badge.fury.io/rb/spree_store_pickup)

## Installation

1. Add this extension to your Gemfile with this line:

    ```bash
    bundle add spree_store_pickup
    ```

2. Run the install generator

    ```bash
    bundle exec rails g spree_store_pickup:install
    ```

3. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Usage

1. Create (or enable) a Shipping Method that represents in‑store pickup. The generator creates a shipping method with a `store_pickup` type. Ensure the shipping method you want to use returns `true` for `store_pickup?`.
2. Create a Payment Method for store pickup (e.g. name: "Pay In Store") whose `method_type` is `store_pickup`.
3. By default this gem only provides helpers:
   * `payment_method.store_pickup?`
   * `payment_method.store_pickup_available?(order)` (true when the order's selected shipping method is store pickup)
4. If you want the Store Pickup payment method to be shown ONLY when the shipping method is store pickup, add a decorator in your host app:

````ruby
module Spree
  module PaymentMethodDecorator
    # Customize availability combining store pickup (and optionally COD) logic.
    def available_for_order?(order)
      return false unless super

      # If shipping method is store pickup, only allow the store pickup payment method.
      if store_pickup_available?(order)
        return store_pickup?
      end

      # Example integration with a COD payment gem (optional):
      if respond_to?(:cod_payment_available?) && cod_payment_available?(order)
        return cod_payment?
      end

      # Hide specialized methods when their conditions are not met.
      if store_pickup? || (respond_to?(:cod_payment?) && cod_payment?)
        return false
      end

      true
    end
  end

  PaymentMethod.prepend PaymentMethodDecorator
end
````

## Developing

1. Create a dummy app

    ```bash
    bundle update
    bundle exec rake test_app
    ```

2. Add your new code

3. Run tests

    ```bash
    bundle exec rspec
    ```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_store_pickup/factories'
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
