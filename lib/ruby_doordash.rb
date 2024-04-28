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

  autoload :BusinessStoreResource, "ruby_doordash/resources/business_store"
  autoload :DeliveryResource, "ruby_doordash/resources/delivery"


end
