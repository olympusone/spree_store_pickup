Rails.application.config.after_initialize do
  Spree.payment_methods << Spree::PaymentMethod::StorePickup

  Spree.admin.partials.shipping_method_form << 'spree/admin/shipping_methods/store_pickup_form'

  Spree::PermittedAttributes.shipping_method_attributes << :store_pickup
end
