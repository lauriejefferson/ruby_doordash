require './test/test_helper'

class MarketplaceTest < Minitest::Test

  def test_create_menu
    token = "fake"
    menu = {
  "reference": "string",
  "store": {
    "merchant_supplied_id": "1dfa934a-190c-43a9-b2e0-449e5b8cccde",
    "provider_type": "positouch"
  },
  "open_hours": [
    {
      "day_index": "MON",
      "start_time": "13:00:00",
      "end_time": "18:00:00"
    }
  ],
  "special_hours": [
    {
      "date": "2021-12-11",
      "closed": true,
      "start_time": "13:00:00",
      "end_time": "18:00:00"
    }
  ],
  "menu": {
    "name": "string",
    "subtitle": "string",
    "merchant_supplied_id": "string",
    "active": true,
    "experience": "voice",
    "categories": [
      {
        "name": "string",
        "subtitle": "string",
        "merchant_supplied_id": "string",
        "active": true,
        "sort_id": 0,
        "items": [
          {
            "name": "string",
            "description": "string",
            "merchant_supplied_id": "string",
            "active": true,
            "is_alcohol": true,
            "is_bike_friendly": true,
            "sort_id": 0,
            "price": 0,
            "base_price": 0,
            "item_special_hours": [
              {
                "day_index": "MON",
                "start_time": "13:00:00",
                "end_time": "18:00:00",
                "start_date": "string",
                "end_date": "string"
              }
            ],
            "extras": [
              {
                "name": "string",
                "merchant_supplied_id": "string",
                "active": true,
                "sort_id": 0,
                "min_num_options": 0,
                "max_num_options": 0,
                "num_free_options": 0,
                "min_option_choice_quantity": 0,
                "max_option_choice_quantity": 0,
                "min_aggregate_options_quantity": 0,
                "max_aggregate_options_quantity": 0,
                "options": [
                  {
                    "item_extra_option_special_hours": [],
                    "operation_context": [],
                    "quantity_info": {},
                    "dish_info": {},
                    "extras": []
                  }
                ]
              }
            ],
            "tax_rate": "string",
            "tax_category": "string",
            "original_image_url": "string",
            "operation_context": [
              "string"
            ],
            "dish_info": {
              "nutritional_info": {
                "calorific_info": {
                  "display_type": "string",
                  "lower_range": 0,
                  "higher_range": 0
                }
              },
              "classification_info": {
                "has_side": true,
                "is_hot": true,
                "is_entree": true,
                "has_alcoholic_items": true,
                "service_types": [
                  "string"
                ],
                "classification_tags": [
                  "TAG_KEY_DIETARY_VEGETARIAN"
                ]
              }
            }
          }
        ]
      }
    ]
  }
}
  stub = stub_request("/api/v1/menus",
                      response: stub_response(fixture: "menu/menu"),
                      method: :post,
                      body: menu
                      )
  client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
  created_menu = client.marketplace.create_menu(**menu)

  assert_equal "string", created_menu.status
  end

  def test_update_menu
    token = "token"
    id = "M-1763"

    menu = {
  "reference": "string",
  "store": {
    "merchant_supplied_id": "1dfa934a-190c-43a9-b2e0-449e5b8cccde",
    "provider_type": "positouch"
  },
  "open_hours": [
    {
      "day_index": "MON",
      "start_time": "13:00:00",
      "end_time": "18:00:00"
    }
  ],
  "special_hours": [
    {
      "date": "2021-12-11",
      "closed": true,
      "start_time": "13:00:00",
      "end_time": "18:00:00"
    }
  ],
  "menu": {
    "name": "string",
    "subtitle": "string",
    "merchant_supplied_id": "string",
    "active": true,
    "experience": "voice",
    "categories": [
      {
        "name": "string",
        "subtitle": "string",
        "merchant_supplied_id": "string",
        "active": true,
        "sort_id": 0,
        "items": [
          {
            "name": "string",
            "description": "string",
            "merchant_supplied_id": "string",
            "active": true,
            "is_alcohol": true,
            "is_bike_friendly": true,
            "sort_id": 0,
            "price": 0,
            "base_price": 0,
            "item_special_hours": [
              {
                "day_index": "MON",
                "start_time": "13:00:00",
                "end_time": "18:00:00",
                "start_date": "string",
                "end_date": "string"
              }
            ],
            "extras": [
              {
                "name": "string",
                "merchant_supplied_id": "string",
                "active": true,
                "sort_id": 0,
                "min_num_options": 0,
                "max_num_options": 0,
                "num_free_options": 0,
                "min_option_choice_quantity": 0,
                "max_option_choice_quantity": 0,
                "min_aggregate_options_quantity": 0,
                "max_aggregate_options_quantity": 0,
                "options": [
                  {
                    "item_extra_option_special_hours": [],
                    "operation_context": [],
                    "quantity_info": {},
                    "dish_info": {},
                    "extras": []
                  }
                ]
              }
            ],
            "tax_rate": "string",
            "tax_category": "string",
            "original_image_url": "string",
            "operation_context": [
              "string"
            ],
            "dish_info": {
              "nutritional_info": {
                "calorific_info": {
                  "display_type": "string",
                  "lower_range": 0,
                  "higher_range": 0
                }
              },
              "classification_info": {
                "has_side": true,
                "is_hot": true,
                "is_entree": true,
                "has_alcoholic_items": true,
                "service_types": [
                  "string"
                ],
                "classification_tags": [
                  "TAG_KEY_DIETARY_VEGETARIAN"
                ]
              }
            }
          }
        ]
      }
    ]
  }
}

  stub = stub_request("/api/v1/menus/#{id}",
                      response: stub_response(fixture: "menu/reference"),
                      method: :patch,
                      body: menu
                      )
  client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
  updated_menu = client.marketplace.update_menu(id: id, **menu)

  assert_equal "string", updated_menu.status
  end

  def test_store_info
    token = "token"
    location_id = "S-001"

    stub = stub_request("/api/v1/stores/#{location_id}/store_details",
                      response: stub_response(fixture: "marketplace/store"),
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    store_details = client.marketplace.get_store_info(location_id: location_id)

    assert_equal "store deactivated", store_details.current_deactivations[0].notes
  end

  def test_activate_store

  end

  def test_activate_item

  end

  def test_activate_item_options

  end

  def test_get_store_menu_details

  end

  def test_store_menu_jsons

  end
end
