module Spree
  module PaymentMethodDecorator
    def store_pickup?
      method_type == 'store_pickup'
    end

    def store_pickup_available?(order)
      order.shipping_method&.store_pickup?
    end
  end
end

Spree::PaymentMethod.prepend Spree::PaymentMethodDecorator
