module Spree
  module PaymentMethodDecorator
    def available_for_order?(order)
      return store_pickup? && super if order.shipping_method&.store_pickup?

      !store_pickup? && super
    end

    def store_pickup?
      method_type == 'store_pickup'
    end
  end
end

Spree::PaymentMethod.prepend Spree::PaymentMethodDecorator
