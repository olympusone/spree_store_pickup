Rails.application.config.after_initialize do
  Rails.application.config.spree.payment_methods << Spree::PaymentMethod::StorePickup

  # Admin partials
  Rails.application.config.spree_admin.shipping_method_form_partials << 'spree/admin/shipping_methods/store_pickup_form'

  Spree::PermittedAttributes.shipping_method_attributes << :store_pickup
end
