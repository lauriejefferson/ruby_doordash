# frozen_string_literal: true

RSpec.describe RubyDoordash do
  it "has a version number" do
    expect(RubyDoordash::VERSION).not_to be nil
  end

  # it "gets a delivery" do
  #   delivery = {
  #     'token': '',
  #     'external_delivery_id': 'f1203080-00cb-4d4c-b589-bb7ccb0de73b'
  #   }

  #   order_details = RubyDoordash::Delivery.new
  #   res = order_details.get_delivery(delivery)
  #   json = JSON.parse(res.body, symbolize_names: true)
  #   expect(json).to eq({
  #     "external_delivery_id": "f1203080-00cb-4d4c-b589-bb7ccb0de73b",
  #     "currency": "USD",
  #     "delivery_status": "delivered",
  #     "fee": 975,
  #     "pickup_address": "1000 4th Avenue, Seattle, WA 98104",
  #     "pickup_business_name": "Seattle Public Library",
  #     "pickup_phone_number": "+1(855)9731040",
  #     "pickup_instructions": "please take it to floor 21",
  #     "pickup_external_store_id": "cdb66d82-7250-44ed-983f-b6bdc1d79ae8",
  #     "dropoff_address": "1201 2nd Avenue #12, Seattle, WA 98101",
  #     "dropoff_business_name": "Doordash Seattle",
  #     "dropoff_location": {
  #         "lat": 47.6069252,
  #         "lng": -122.3370453
  #     },
  #     "dropoff_phone_number": "+1(855)9731040",
  #     "dropoff_instructions": "please take it to floor 21",
  #     "dropoff_contact_given_name": "",
  #     "dropoff_contact_family_name": "",
  #     "dropoff_contact_send_notifications": true,
  #     "order_value": 5555,
  #     "updated_at": "2023-06-30T18:52:25.482859Z",
  #     "pickup_time_estimated": "2023-06-30T18:58:00Z",
  #     "pickup_time_actual": "2023-06-30T18:58:00.102811Z",
  #     "dropoff_time_estimated": "2023-06-30T18:58:06Z",
  #     "dropoff_time_actual": "2023-06-30T18:58:06.316579Z",
  #     "tax": 0,
  #     "support_reference": "2028064817",
  #     "tracking_url": "https://track.doordash.com/order/cd96e159-8ea6-4cdf-ae60-9b83ea871b8c/track",
  #     "dropoff_verification_image_url": "https://developer.doordash.com/en-US/img/simulator/frontdoor.png",
  #     "contactless_dropoff": false,
  #     "action_if_undeliverable": "return_to_pickup",
  #     "tip": 0,
  #     "order_contains": {
  #         "alcohol": false
  #     },
  #     "dropoff_requires_signature": false,
  #     "dropoff_cash_on_delivery": 0,
  #     "dasher_id": 18093817,
  #     "dasher_name": "TAS-DASHER-07 T."
  #   })
  # end
  it "creates a quote" do 
    token = ''
    quote =  {
      "external_delivery_id": "D-1763",
      "token": token,
      "locale": "en-US",
      "order_fulfillment_method": "standard",
      "origin_facility_id": "MERCHANTA-CA-1",
      "pickup_address": "901 Market Street 6th Floor San Francisco, CA 94103",
      "pickup_business_name": "Wells Fargo SF Downtown",
      "pickup_phone_number": "+16505555555",
      "pickup_instructions": "Go to the bar for pick up.",
      "pickup_reference_tag": "Order number 61",
      "pickup_external_business_id": "ase-243-dzs",
      "pickup_external_store_id": "ase-243-dzs",
      "dropoff_address": "901 Market Street 6th Floor San Francisco, CA 94103",
      "dropoff_business_name": "Doordash Headquarters",
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
        "proof_of_delivery": "photo_required"
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
        "alcohol": false
      },
      "dasher_allowed_vehicles": [
        "car",
        "bicycle",
        "walking"
      ],
      "dropoff_requires_signature": false,
      "promotion_id": "ee680b87-0016-496e-ac3c-d3f33ab54c1c",
      "dropoff_cash_on_delivery": 1999
    }

    order_quote = RubyDoordash::Delivery.new
    res = order_quote.create_quote(quote)
    json = JSON.parse(res.body, symbolize_names: true)
    # expect(res.status).to eq(200)
    p json
  end
end
