import '@hotwired/turbo-rails'
import { Application } from '@hotwired/stimulus'

let application

if (typeof window.Stimulus === "undefined") {
  application = Application.start()
  application.debug = false
  window.Stimulus = application
} else {
  application = window.Stimulus
}

import SpreeStorePickupController from 'spree_store_pickup/controllers/spree_store_pickup_controller' 

application.register('spree_store_pickup', SpreeStorePickupController)