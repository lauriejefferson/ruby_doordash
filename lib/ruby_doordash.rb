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
  end

  module DriveClassic
    autoload :BusinessResource, "ruby_doordash/resources/drive_classic/business"
    autoload :StoreResource, "ruby_doordash/resources/drive_classic/store"
  end


  # Classes used to return a nicer object wrapping the response data
  autoload :Business, "ruby_doordash/objects/business"
  autoload :Cancellation, "ruby_doordash/objects/cancellation"
  autoload :Delivery, "ruby_doordash/objects/delivery"
  autoload :Estimate, "ruby_doordash/objects/estimate"
  autoload :Store, "ruby_doordash/objects/store"
  autoload :Validation, "ruby_doordash/objects/validation"
end
