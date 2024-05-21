require './test/test_helper'

class DeliveryResourceTest < Minitest::Test
  def test_create_delivery_estimate
    token = "fake"
    estimate = {
      "pickup_address": {
        "city": "San Francisco",
        "state": "California",
        "street": "101 Howard Street",
        "unit": "Apt 301",
        "zip_code": "94105",
        "full_address": "901 Market Street 6th Floor, San Francisco, CA 94103"
      },
      "dropoff_address": {
        "city": "San Francisco",
        "state": "California",
        "street": "901 Market Street",
        "unit": "Suite #600",
        "zip_code": "94105",
        "full_address": "901 Market Street 6th Floor, San Francisco, CA 94103",
        "location": {
          "lat": 37.78,
          "lng": -122.4
        }
      },
      "order_value": 1999,
      "delivery_time": "2018-08-22T17:21:28Z",
      "pickup_time": "2018-08-22T17:20:28Z",
      "external_business_name": "1443432456",
      "external_business_id": "a0720d55-7cbe-41ce-8185-58285b7985cd",
      "external_store_id": "mega-corp-2340593",
      "promotion_id": "ee680b87-0016-496e-ac3c-d3f33ab54c1c",
      "items": [
        {
          "name": "Mega Bean and Cheese Burrito",
          "description": "Mega Burrito contains the biggest beans of the land with extra cheese.",
          "barcode": "12342830041",
          "quantity": 2,
          "external_id": "123-123443434b",
          "volume": 5.3,
          "weight": 2.8,
          "length": 2.8,
          "width": 2.8,
          "height": 2.8,
          "price": 1000
        }
      ]
    }

    stub = stub_request("drive/v1/estimates",
                        response: stub_response(fixture: "delivery/estimate"),
                        method: :post,
                        body: estimate)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery_classic.create_delivery_estimate(**estimate)

    assert_equal 1900, delivery.fee
  end
  def test_create_delivery_vaidation
    token = "fake"
    delivery = {
      "pickup_address": {
        "city": "San Francisco",
        "state": "California",
        "street": "101 Howard Street",
        "unit": "Apt 301",
        "zip_code": "94105",
        "full_address": "901 Market Street 6th Floor, San Francisco, CA 94103"
      },
      "pickup_phone_number": "+15555555555",
      "pickup_instructions": "Use the back alley of the store for pickup",
      "dropoff_address": {
        "city": "San Francisco",
        "state": "California",
        "street": "901 Market Street",
        "unit": "Suite #600",
        "zip_code": "94105",
        "full_address": "901 Market Street 6th Floor, San Francisco, CA 94103",
        "location": {
          "lat": 37.78,
          "lng": -122.4
        }
      },
      "customer": {
        "phone_number": "+16505555555",
        "business_name": "Mega Corp HQ",
        "first_name": "Jane",
        "last_name": "Goodall",
        "email": "jane.goodall@megacorp.io",
        "should_send_notifications": true,
        "locale": "en-US"
      },
      "dropoff_instructions": "Use the access code 420 to get into the building.",
      "order_value": 1999,
      "tip": 500,
      "pickup_time": "2018-08-22T17:20:28Z",
      "delivery_time": "2018-08-22T17:21:28Z",
      "external_delivery_id": "1342666-2420",
      "contains_alcohol": true,
      "barcode_scanning_required": true,
      "num_items": 1,
      "external_business_name": "1443432456",
      "external_business_id": "a0720d55-7cbe-41ce-8185-58285b7985cd",
      "external_store_id": "mega-corp-2340593",
      "signature_required": true,
      "promotion_id": "ee680b87-0016-496e-ac3c-d3f33ab54c1c"
    }

    stub = stub_request("drive/v1/validations",
                        response: stub_response(fixture: "delivery/validation"),
                        method: :post,
                        body: delivery)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery_classic.create_delivery_validation(**delivery)

    assert_equal true, delivery.valid
  end
  def test_create_delivery
    token = "fake"
    delivery = {
  "pickup_address": {
    "city": "San Francisco",
    "state": "California",
    "street": "101 Howard Street",
    "unit": "Apt 301",
    "zip_code": 94105,
    "location": {
      "lng": -122.431297,
      "lat": 37.773972
    }
  },
  "pickup_phone_number": "+16505555555",
  "dropoff_address": {
    "city": "San Francisco",
    "state": "California",
    "street": "901 Market Street",
    "unit": "Suite #600",
    "zip_code": "94105",
    "full_address": "901 Market Street 6th Floor, San Francisco, CA 94103",
    "location": {
      "lat": 37.78,
      "lng": -122.4
    }
  },
  "customer": {
    "phone_number": "+16505555555",
    "business_name": "Mega Corp HQ",
    "first_name": "Jane",
    "last_name": "Goodall",
    "email": "jane.goodall@megacorp.io",
    "should_send_notifications": true,
    "locale": "en-US"
  },
  "order_value": 1999,
  "pickup_time": "2018-08-22T17:20:28Z",
  "delivery_time": "2018-08-22T17:21:28Z",
  "pickup_window_start_time": "2018-08-22T17:20:12Z",
  "pickup_window_end_time": "2018-08-22T17:40:28Z",
  "delivery_window_start_time": "2018-08-22T18:15:28Z",
  "delivery_window_end_time": "2018-08-22T18:35:28Z",
  "items": [
    {
      "name": "Mega Bean and Cheese Burrito",
      "description": "Mega Burrito contains the biggest beans of the land with extra cheese.",
      "barcode": "12342830041",
      "quantity": 2,
      "external_id": "123-123443434b",
      "volume": 5.3,
      "weight": 2.8,
      "length": 2.8,
      "width": 2.8,
      "height": 2.8,
      "price": 1000
    }
  ],
  "team_lift_required": true,
  "barcode_scanning_required": false,
  "pickup_business_name": "Chipotle",
  "pickup_instructions": "Enter gate code 1234 on the callbox.",
  "dropoff_instructions": "Lock the front door after delivering the food.",
  "order_volume": 5,
  "tip": 500,
  "external_delivery_id": "1342666-2420",
  "driver_reference_tag": "1",
  "external_business_name": "1443432456",
  "external_business_id": "a0720d55-7cbe-41ce-8185-58285b7985cd",
  "external_store_id": "mega-corp-2340593",
  "contains_alcohol": false,
  "requires_catering_setup": true,
  "num_items": 1,
  "signature_required": false,
  "allow_unattended_delivery": true,
  "cash_on_delivery": 1000,
  "delivery_metadata": {
    "foo": "bar"
  },
  "allowed_vehicles": [
    "car",
    "bicycle"
  ],
  "is_contactless_delivery": false,
  "promotion_id": "ee680b87-0016-496e-ac3c-d3f33ab54c1c",
  "order_contains_list": [
    "pharmacy_items",
    "age_restricted_pharmacy_items"
  ]
}

    stub = stub_request("drive/v1/deliveries",
                        response: stub_response(fixture: "delivery/delivery_classic"),
                        method: :post,
                        body: delivery)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery_classic.create_delivery(**delivery)

    assert_equal "USD", delivery.currency
  end
  def test_get_delivery_details
    token = "fake"
    delivery_id = "1342666-2420"

    stub = stub_request("drive/v1/deliveries/#{delivery_id}",
                        response: stub_response(fixture: "delivery/delivery_classic")
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery_classic.get_delivery_details(delivery_id: delivery_id)

    assert_equal 520, delivery.tax
  end
  def test_update_delivery_details
    token = "fake"
    delivery_id = "1342666-2420"
    delivery = {
  "pickup_business_name": "Chipotle",
  "pickup_instructions": "Enter gate code 1234 on the callbox.",
  "pickup_phone_number": "+15555555555",
  "quoted_delivery_time": "2018-08-22T17:21:28Z",
  "quoted_pickup_time": "2018-08-22T17:20:28Z",
  "pickup_window_start_time": "2018-08-22T17:20:28Z",
  "pickup_window_end_time": "2018-08-22T17:21:28Z",
  "delivery_window_start_time": "2018-08-22T17:22:28Z",
  "delivery_window_end_time": "2018-08-22T17:23:28Z",
  "dropoff_address": {
    "city": "San Francisco",
    "state": "California",
    "street": "901 Market Street",
    "unit": "Suite #600",
    "zip_code": "94105",
    "full_address": "901 Market Street 6th Floor, San Francisco, CA 94103",
    "location": {
      "lat": 37.78,
      "lng": -122.4
    }
  },
  "first_name": "John",
  "last_name": "Smith",
  "business_name": "Some Company Inc",
  "customer_phone_number": "+15555555555",
  "dropoff_special_instructions": "Lock the front door after delivering the food.",
  "signature_required": false,
  "allow_unattended_delivery": false,
  "contains_alcohol": false,
  "delivery_metadata": {
    "weight": "foo",
    "volume": "bar",
    "contains_batteries": true
  },
  "allowed_vehicles": [
    "car",
    "bicycle",
    "walker"
  ],
  "tip": 1300,
  "order_ready_time": "2018-08-22T17:20:28Z"
}
    stub = stub_request("drive/v1/deliveries/#{delivery_id}",
                        response: stub_response(fixture: "delivery/delivery_classic"),
                        method: :patch,
                        body: delivery
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery_classic.update_delivery(delivery_id: delivery_id, **delivery)

    assert_equal 520, delivery.tax
  end

  def cancel_delivery_details
    token = "fake"
    delivery_id = "D-1763"
    reason = {
      "reason_code": "cold_chain"
    }

    stub = stub_request("drive/v1/deliveries/#{delivery_id}/cancel",
                        response: stub_response(fixture: "delivery/reason"),
                        method: :put,
                        body: reason
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery_classic.cancel_delivery(delivery_id: delivery_id, **reason)

    assert_equal true, delivery.return_initiated
  end
end
