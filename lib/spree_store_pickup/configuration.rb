module SpreeStorePickup
  class Configuration < Spree::Preferences::Configuration
    # When true, selecting store pickup shipping shows only the store pickup payment method.
    preference :exclusive_payment_method, :boolean, default: false
  end
end
