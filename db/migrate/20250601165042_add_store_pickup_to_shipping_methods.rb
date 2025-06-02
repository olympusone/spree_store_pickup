class AddStorePickupToShippingMethods < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_shipping_methods, :store_pickup, :boolean, default: false, null: false
  end
end
