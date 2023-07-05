# frozen_string_literal: true

require_relative "ruby_doordash/version"
require 'faraday'


module RubyDoordash
  class Error < StandardError; end
  # Your code goes here...
  class Delivery
    API_ENDPOINT = 'https://openapi.doordash.com/'.freeze

     def create_quote(quote)
        conn = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.request :authorization, 'Bearer', quote[:token]
        end

        response = conn.post('/drive/v2/quotes') do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = {
            external_delivery_id: quote[:external_delivery_id],
            locale: quote[:locale],
            order_fulfillment_method: quote[:order_fulfillment_method],
            origin_facility_id: quote[:origin_facility_id],
            pickup_address: quote[:pickup_addres],
            pickup_business_name: quote[:pickup_business_name],
            pickup_instructions: quote[:pickup_instructions],
            pickup_reference_tag: quote[:pickup_reference_tag],
            pickup_external_business_id: quote[:pickup_external_business_id],
            pickup_external_store_id: quote[:pickup_external_store_id],
            dropoff_address: quote[:dropoff_address],
            dropoff_business_name: quote[:dropoff_business_name],
            dropoff_location: quote[:dropoff_location],
            dropoff_phone_number: quote[:dropoff_phone_number],
            dropoff_instructions: quote[:dropoff_instructions],
            dropoff_contact_given_name: quote[:dropoff_contact_given_name],
            dropoff_contact_family_name: quote[:dropoff_contact_family_name],
            dropoff_contact_send_notifications: quote[:dropoff_contact_send_notifications],
            shopping_options: quote[:shopping_options_options],
            order_value: quote[:order_value],
            items: quote[:items],
            pickup_time: quote[:pickup_time],
            dropoff_time: quote[:dropoff_time],
            pickup_window: quote[:pickup_window],
            dropoff_window: quote[:dropoff_window],
            contactless_dropoff: quote[:contactless_dropoff],
            action_if_undeliverable: quote[:action_if_undeliverable],
            tip: quote[:tip],
            dasher_allowed_vehicles: quote[:dasher_allowed_vehicles],
            dropoff_requires_signature: quote[:dropoff_requires_signature],
            promotion_id: quote[:promotion_id],
            dropoff_cash_on_delivery: quote[:dropoff_cash_on_delivery]
          }.to_json
       end
    end

     def accept_quote(quote)
        conn = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.request :authorization, 'Bearer', delivery[:token]
        end

        response = conn.post('/quotes') do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = {
            external_delivery_id: quote[:id],
            tip: quote[:tip],
            dropoff_phone_number: quote[:dropoff_phone_number],
          }.to_json
       end
    end

    
    def create_delivery(delivery)
        conn = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.request :authorization, 'Bearer', delivery[:token]
        end

        response = conn.post('/deliveries') do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = {
            external_delivery_id: delivery[:id],
            locale: delivery[:locale],
            order_fulfillment_method: delivery[:order_fulfillment_method],
            order_facility_id: delivery[:order_facility_id],
            pickup_addres: delivery[:address],
            pickup_business_name: delivery[:pickup_business_name],
            pickup_phone_number: delivery[:pickup_phone_number],
            pickup_instructions: delivery[:pickup_instructions],
            pickup_reference_tag: delivery[:pickup_reference_tag],
            pickup_external_business_id: delivery[:pickup_external_business_id],
            pickup_external_store_id: delivery[:pickup_external_store_id],
            dropoff_address: delivery[:dropoff_address],
            dropoff_business_name: delivery[:dropoff_business_name],
            dropoff_location: delivery[:dropoff_location],
            dropoff_phone_number: delivery[:dropoff_phone_number],
            dropoff_instructions: delivery[:dropoff_instructions],
            dropoff_contact_given_name: delivery[:dropoff_contact_given_name],
            dropoff_contact_family_name: delivery[:dropoff_contact_family_name],
            shopping_options: delivery[:shopping_options],
            order_value: delivery[:order_value],
            items: delivery[:items],
            pickup_time: delivery[:pickup_time],
            dropoff_time: delivery[:dropoff_time],
            pickup_window: delivery[:pickup_window],
            dropoff_window: delivery[:dropoff_window],
            contactless_dropoff: delivery[:contactless_dropoff],
            action_if_undeliverable: delivery[:action_if_undeliverable],
            tip: delivery[:tip],
            order_contains: delivery[:order_contains],
            dasher_allowed_vehicles: delivery[:dasher_allowed_vehicles],
            dropoff_requires_signature: delivery[:dropoff_requires_signature],
            promotion_id: delivery[:promotion_id],
            dropoff_cash_on_delivery: delivery[:dropoff_cash_on_delivery]
          }.to_json
       end
    end

    def get_delivery(delivery)
      conn = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.request :authorization, 'Bearer', delivery[:token]
      end

      response = conn.get("/drive/v2/deliveries/#{delivery[:external_delivery_id]}") do |req|
        req.headers[:accept_encoding] = 'none'
      end

    end

    def update_delivery(delivery)
        conn = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.request :authorization, 'Bearer', delivery[:token]
        end

        response = conn.patch("/deliveries/#{delivery[:external_delivery_id]}") do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = {
            external_delivery_id: delivery[:id],
            pickup_addres: delivery[:address],
            pickup_business_name: delivery[:pickup_business_name],
            pickup_phone_number: delivery[:pickup_phone_number],
            pickup_instructions: delivery[:pickup_instructions],
            pickup_reference_tag: delivery[:pickup_reference_tag],
            pickup_external_business_id: delivery[:pickup_external_business_id],
            pickup_external_store_id: delivery[:pickup_external_store_id],
            dropoff_address: delivery[:dropoff_address],
            dropoff_business_name: delivery[:dropoff_business_name],
            dropoff_location: delivery[:dropoff_location],
            dropoff_phone_number: delivery[:dropoff_phone_number],
            dropoff_instructions: delivery[:dropoff_instructions],
            dropoff_contact_given_name: delivery[:dropoff_contact_given_name],
            dropoff_contact_family_name: delivery[:dropoff_contact_family_name],
            dropoff_contact_send_notifications: delivery[:dropoff_contact_send_notifications],
            dropoff_options: delivery[:dropoff_options],
            contactless_dropoff: delivery[:contactless_dropoff],
            tip: delivery[:tip],
            order_contains: delivery[:order_contains],
            dasher_allowed_vehicles: delivery[:dasher_allowed_vehicles],
            dropoff_requires_signature: delivery[:dropoff_requires_signature],
            promotion_id: delivery[:promotion_id],
            dropoff_cash_on_delivery: delivery[:dropoff_cash_on_delivery],
            shopping_options: delivery[:shopping_options],
            order_value: delivery[:order_value],
            items: delivery[:items],
            pickup_time: delivery[:pickup_time],
            dropoff_time: delivery[:dropoff_time],
            pickup_window: delivery[:pickup_window],
            dropoff_window: delivery[:dropoff_window],
          }.to_json
       end
    end

    def cancel_delivery(delivery)
      conn = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.request :authorization, 'Bearer', delivery[:token]
      end

      response = conn.put("/deliveries/#{delivery[:external_delivery_id]}/cancel") do |req|
          req.headers['Content-Type'] = 'application/json'
      end
    end
  end
end
