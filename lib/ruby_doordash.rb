# frozen_string_literal: true
require 'faraday'
require 'faraday/middleware'
require 'ruby_doordash/version'

module RubyDoordash
  autoload :Client, "ruby_doordash/client"
  autoload :Error, "ruby_doordash/error"
  autoload :Resource, "ruby_doordash/resource"
  autoload :Object, "ruby_doordash/object"

  # High-level categories of DoorDash API calls
  module Drive
    autoload :DeliveryResource, "ruby_doordash/resources/drive/delivery"
    autoload :MarketplaceResource, "ruby_doordash/resources/drive/marketplace"
    autoload :MarketplaceRetailersResource, "ruby_doordash/resources/drive/marketplace_retailers"
  end

  module DriveClassic
    autoload :BusinessStoreResource, "ruby_doordash/resources/drive_classic/business_store"
    autoload :DeliveryResource, "ruby_doordash/resources/drive_classic/delivery"
    autoload :MarketplaceLegacyResource, "ruby_doordash/resources/drive_classic/marketplace_legacy"
    autoload :ReportingResource, "ruby_doordash/resources/drive_classic/reporting"
  end


  # Classes used to return a nicer object wrapping the response data
  autoload :BatchAddOrUpdateItemRequest, "ruby_doordash/objects/batch_add_or_update_item_request"
  autoload :BatchAddOrUpdateStoreItemRequest, "ruby_doordash/objects/batch_add_or_update_store_item_request"
  autoload :Business, "ruby_doordash/objects/business"
  autoload :DeliveryCancellation, "ruby_doordash/objects/delivery_cancellation"
  autoload :CreateJobRequest, "ruby_doordash/objects/create_job_request"
  autoload :CreatePullStoreItemsJobParamaeters, "ruby_doordash/objects/create_pull_store_items_job_parameters"
  autoload :Delivery, "ruby_doordash/objects/delivery"
  autoload :Estimate, "ruby_doordash/objects/estimate"
  autoload :ExistingStore, "ruby_doordash/objects/existing_store"
  autoload :ItemActibation, "ruby_doordash/objects/item_activation"
  autoload :ItemOptionActivaton, "ruby_doordash/objects/item_option_activation"
  autoload :Item, "ruby_doordash/objects/item"
  autoload :MerchantOrderRecord, "ruby_doordash/objects/merchant_order_record"
  autoload :MxOrderAdjustRecord, "ruby_doordash/objects/mx_order_adjust_record"
  autoload :Order, "ruby_doordash/objects/order"
  autoload :OrderCancellation, "ruby_doordash/objects/order_cancellation"
  autoload :ReportLink, "ruby_doordash/objects/report_link"
  autoload :StoreActivationStatus, "ruby_doordash/objects/store_activation_status"
  autoload :StoreConfirmOrderReadyForPickupRecord, "ruby_doordash/objects/store_confirm_order_ready_for_pickup_record"
  autoload :StoreDetails, "ruby_doordash/objects/store_details"
  autoload :StoreItem, "ruby_doordash/objects/store_item"
  autoload :StoreMenu, "ruby_doordash/objects/store_menu"
  autoload :StoreMenuDetails, "ruby_doordash/objects/store_menu_details"
  autoload :Store, "ruby_doordash/objects/store"
  autoload :Validation, "ruby_doordash/objects/validation"
end
