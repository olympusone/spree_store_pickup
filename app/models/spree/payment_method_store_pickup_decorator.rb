module Spree
  module PaymentMethodStorePickupDecorator
    def store_pickup?
      method_type == 'store_pickup'
    end

    def store_pickup_available?(order)
      order.shipping_method&.store_pickup?
    end

    def available_for_order?(order)
      return false unless super

      # Store pickup payment is only available with store pickup shipping.
      return store_pickup_available?(order) if store_pickup?

      # Optionally restrict store pickup shipping to the store pickup payment method only.
      return false if SpreeStorePickup::Config[:exclusive_payment_method] && store_pickup_available?(order)

      true
    end
  end

  PaymentMethod.prepend PaymentMethodStorePickupDecorator
end
