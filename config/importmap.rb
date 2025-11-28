pin 'application-spree-store-pickup', to: 'spree_store_pickup/application.js', preload: false

pin_all_from SpreeStorePickup::Engine.root.join('app/javascript/spree_store_pickup/controllers'),
             under: 'spree_store_pickup/controllers',
             to:    'spree_store_pickup/controllers',
             preload: 'application-spree-store-pickup'
