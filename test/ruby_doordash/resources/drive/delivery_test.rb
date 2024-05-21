require './test/test_helper'

class DeliveryResourceTest < Minitest::Test
  def test_get_delivery
    external_delivery_id = 'D-1763'
    token = "fake"
    stub = stub_request("/drive/v2/deliveries/#{external_delivery_id}", response: stub_response(fixture: "delivery/delivery"))
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery.get_delivery(external_delivery_id: external_delivery_id)

    assert_equal RubyDoordash::Delivery, delivery.class
    assert_equal "D-1763", delivery.external_delivery_id
  end

  def test_create_quote
    token = "fake"
    quote = {
  "external_delivery_id": "D-1763",
  "locale": "en-US, fr-CA, es-US",
  "order_fulfillment_method": "standard",
  "origin_facility_id": "MERCHANTA-CA-1",
  "pickup_address": "901 Market Street 6th Floor San Francisco, CA 94103",
  "pickup_business_name": "Wells Fargo SF Downtown",
  "pickup_phone_number": "+16505555555",
  "pickup_instructions": "Go to the bar for pick up.",
  "pickup_reference_tag": "Order number 61",
  "pickup_external_business_id": "ase-243-dzs",
  "pickup_external_store_id": "ase-243-dzs",
  "pickup_verification_metadata": {
    "verification_type": "SCAN_BARCODE",
    "verification_code": "12345",
    "verification_format": "CODE_39"
  },
  "dropoff_address": "901 Market Street 6th Floor San Francisco, CA 94103",
  "dropoff_business_name": "The Avery Condominium",
  "dropoff_location": {
    "lat": 123.1312343,
    "lng": -37.2144343
  },
  "dropoff_phone_number": "+16505555555",
  "dropoff_instructions": "Enter gate code 1234 on the callbox.",
  "dropoff_contact_given_name": "John",
  "dropoff_contact_family_name": "Doe",
  "dropoff_contact_send_notifications": true,
  "dropoff_options": {
    "signature": "required",
    "id_verification": "required",
    "proof_of_delivery": "photo_required",
    "catering_setup": "required"
  },
  "dropoff_address_components": {
    "street_address": "901 Market Street",
    "sub_premise": "Apt. 121",
    "city": "San Francisco",
    "state": "CA",
    "zip_code": 94103,
    "country": "US"
  },
  "shopping_options": {
    "payment_method": "red_card",
    "payment_barcode": "12345",
    "payment_gift_cards": [
      "123443434",
      "123443435"
    ],
    "ready_for_pickup_by": "2018-08-22T17:20:28Z",
    "dropoff_contact_loyalty_number": "1234-5678-9876-5432-1"
  },
  "order_value": 1999,
  "items": [
    {
      "name": "Mega Bean and Cheese Burrito",
      "description": "Mega Burrito contains the biggest beans of the land with extra cheese.",
      "quantity": 2,
      "external_id": "123-123443434b",
      "external_instance_id": 12,
      "volume": 5.3,
      "weight": 2.8,
      "length": 2.8,
      "width": 2.8,
      "height": 2.8,
      "price": 1000,
      "barcode": 12342830041,
      "item_options": {
        "substitute_item_ids": [
          "123443434",
          "123443435"
        ],
        "weight_unit": "oz",
        "substitution_preference": "refund"
      }
    }
  ],
  "pickup_time": "2018-08-22T17:20:28Z",
  "dropoff_time": "2018-08-22T17:20:28Z",
  "pickup_window": {
    "start_time": "2018-08-22T17:20:28Z",
    "end_time": "2018-08-22T17:20:28Z"
  },
  "dropoff_window": {
    "start_time": "2018-08-22T17:20:28Z",
    "end_time": "2018-08-22T17:20:28Z"
  },
  "contactless_dropoff": false,
  "action_if_undeliverable": "return_to_pickup",
  "tip": 599,
  "order_contains": {
    "alcohol": false,
    "pharmacy_items": false,
    "age_restricted_pharmacy_items": false
  },
  "dasher_allowed_vehicles": [
    "car",
    "bicycle",
    "walking"
  ],
  "dropoff_requires_signature": false,
  "promotion_id": "ee680b87-0016-496e-ac3c-d3f33ab54c1c",
  "dropoff_cash_on_delivery": 1999,
  "order_route_type": "roundtrip",
  "order_route_items": [
    "check"
  ]
}
  stub = stub_request("/drive/v2/quotes", response: stub_response(fixture: "delivery/quote") , method: :post, body: quote)
  client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
  delivery = client.delivery.create_quote(**quote)

  assert_equal "The Avery Condominium", delivery.dropoff_business_name

  end

  def test_accept_quote
    token = "fake"
    body = {
      "tip": 599,
      "dropoff_phone_number": "+16505555555"
    }
    external_delivery_id = 'D-1763'

    stub = stub_request("/drive/v2/quotes/#{external_delivery_id}/accept", response: stub_response(fixture: "delivery/accepted_quote") , method: :post, body: body)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery.accept_quote(external_delivery_id: external_delivery_id, **body)

    assert_equal 1999, delivery.order_value

  end

  # def test_create_delivery
  #   token = "fake"
  #   body = {
  #     "external_delivery_id": "D-1763",
  #     "locale": "en-US, fr-CA, es-US",
  #     "order_fulfillment_method": "standard",
  #     "origin_facility_id": "MERCHANTA-CA-1",
  #     "pickup_address": "901 Market Street 6th Floor San Francisco, CA 94103",
  #     "pickup_business_name": "Wells Fargo SF Downtown",
  #     "pickup_phone_number": "+16505555555",
  #     "pickup_instructions": "Go to the bar for pick up.",
  #     "pickup_reference_tag": "Order number 61",
  #     "pickup_external_business_id": "ase-243-dzs",
  #     "pickup_external_store_id": "ase-243-dzs"
  #   }

  #   stub = stub_request("deliveries", response: stub_response(fixture: "delivery/new_delivery") , method: :post, body: body)
  #   client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
  #   new_delivery = client.delivery.create_delivery(**body)

  #   assert_equal 'D-1763', new_delivery.external_delivery_id
  # end

  def test_update_delivery
    token = "fake"
    external_delivery_id = 'D-1763'
    delivery = {
  "pickup_address": "90 Market Street 6th Floor San Francisco, CA 94103",
  "pickup_business_name": "Wells Fargo SF Downtown",
  "pickup_phone_number": "+16505555555",
  "pickup_instructions": "Go to the bar for pick up.",
  "pickup_reference_tag": "Order number 61",
  "pickup_external_business_id": "ase-243-dzs",
  "pickup_external_store_id": "ase-243-dzs",
  "pickup_verification_metadata": {
    "verification_type": "SCAN_BARCODE",
    "verification_code": "12345",
    "verification_format": "CODE_39"
  },
  "dropoff_address": "901 Market Street 6th Floor San Francisco, CA 94103",
  "dropoff_business_name": "The Avery Condominium",
  "dropoff_location": {
    "lat": 123.1312343,
    "lng": -37.2144343
  },
  "dropoff_phone_number": "+16505555555",
  "dropoff_instructions": "Enter gate code 1234 on the callbox.",
  "dropoff_contact_given_name": "John",
  "dropoff_contact_family_name": "Doe",
  "dropoff_contact_send_notifications": true,
  "dropoff_options": {
    "signature": "required",
    "id_verification": "required",
    "proof_of_delivery": "photo_required",
    "catering_setup": "required"
  },
  "dropoff_address_components": {
    "street_address": "901 Market Street",
    "sub_premise": "Apt. 121",
    "city": "San Francisco",
    "state": "CA",
    "zip_code": 94103,
    "country": "US"
  },
  "contactless_dropoff": false,
  "action_if_undeliverable": "return_to_pickup",
  "tip": 599,
  "order_contains": {
    "alcohol": false,
    "pharmacy_items": false,
    "age_restricted_pharmacy_items": false
  },
  "dasher_allowed_vehicles": [
    "car",
    "bicycle",
    "walking"
  ],
  "dropoff_requires_signature": false,
  "promotion_id": "ee680b87-0016-496e-ac3c-d3f33ab54c1c",
  "dropoff_cash_on_delivery": 1999,
  "order_route_type": "roundtrip",
  "order_route_items": [
    "check"
  ],
  "order_value": 1999,
  "items": [
    {
      "name": "Mega Bean and Cheese Burrito",
      "description": "Mega Burrito contains the biggest beans of the land with extra cheese.",
      "quantity": 2,
      "external_id": "123-123443434b",
      "external_instance_id": 12,
      "volume": 5.3,
      "weight": 2.8,
      "length": 2.8,
      "width": 2.8,
      "height": 2.8,
      "price": 1000,
      "barcode": 12342830041,
      "item_options": {
        "substitute_item_ids": [
          "123443434",
          "123443435"
        ],
        "weight_unit": "oz",
        "substitution_preference": "refund"
      }
    }
  ],
  "pickup_time": "2018-08-22T17:20:28Z",
  "dropoff_time": "2018-08-22T17:20:28Z",
  "pickup_window": {
    "start_time": "2018-08-22T17:20:28Z",
    "end_time": "2018-08-22T17:20:28Z"
  },
  "dropoff_window": {
    "start_time": "2018-08-22T17:20:28Z",
    "end_time": "2018-08-22T17:20:28Z"
  }
}

    stub = stub_request("/drive/v2/deliveries/#{external_delivery_id}", response: stub_response(fixture: "delivery/delivery") , method: :patch, body: delivery)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery.update_delivery(external_delivery_id: external_delivery_id, **delivery)

    assert_equal 1999, delivery.order_value
  end

  def test_cancel_delivery
    token = "fake"
    external_delivery_id = "D-1763"

    stub = stub_request("/drive/v2/deliveries/#{external_delivery_id}/cancel", response: stub_response(fixture: "delivery/delivery") , method: :put)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    cancelled_delivery = client.delivery.cancel_delivery(external_delivery_id: external_delivery_id)

    assert_equal "D-1763", cancelled_delivery.external_delivery_id
  end
end
