require './test/test_helper'

class BusinessStoreResourceTest < Minitest::Test

  def test_get_business
    token = "fake"
    external_business_id = "a0720d55-7cbe-41ce-8185-58285b7985cd"

    stub = stub_request("developer/v1/businesses/#{external_business_id}",
                        response: stub_response(fixture: "business_store/business"))
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    business = client.business_store.get_business(external_business_id: external_business_id)

    assert_equal "Neighborhood Deli", business.name
  end
  def test_update_business
    token = "fake"
    external_business_id = "a0720d55-7cbe-41ce-8185-58285b7985cd"

    business = {
      "name": "Neighborhood Deli",
      "description": "A neighborhood deli serving many tasty sandwiches and soups.",
      "activation_status": "active"
    }

    stub = stub_request("developer/v1/businesses/#{external_business_id}",
                        response: stub_response(fixture: "business_store/business"),
                        method: :patch,
                        body: business)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    business = client.business_store.update_business(external_business_id: external_business_id, **business)

    assert_equal "active", business.activation_status
  end
  def test_create_business
    token = "fake"

    business = {
      "external_business_id": "a0720d55-7cbe-41ce-8185-58285b7985cd",
      "name": "Neighborhood Deli",
      "description": "A neighborhood deli serving many tasty sandwiches and soups.",
      "activation_status": "active"
    }

    stub = stub_request("developer/v1/businesses",
                        response: stub_response(fixture: "business_store/business"),
                        method: :post,
                        body: business)
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    business = client.business_store.create_business(**business)

    assert_equal "active", business.activation_status
  end
  # def test_list_businesses
  #   token = "fake"

  #   stub = stub_request("developer/v1/businesses",
  #                       response: stub_response(fixture: "business_store/businesses"),
  #                     )
  #   client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
  #   businesses = client.business_store.list_businesses()

  #   assert_equal "Neighborhood Deli", businesses.result.name
  # end
  def test_get_store
    token = "fake"
    external_business_id = "a0720d55-7cbe-41ce-8185-58285b7985cd"
    external_store_id = "ed178ef3-b486-4ce8-8baa-5bc9f0f3fa4a"

    stub = stub_request("developer/v1/businesses/#{external_business_id}/stores/#{external_store_id}",
                        response: stub_response(fixture: "business_store/store"),
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    store = client.business_store.get_store(external_business_id: external_business_id, external_store_id: external_store_id)

    assert_equal "Neighborhood Deli #10", store.name
  end
  def test_update_store
    token = "fake"
    external_business_id = "a0720d55-7cbe-41ce-8185-58285b7985cd"
    external_store_id = "ed178ef3-b486-4ce8-8baa-5bc9f0f3fa4a"
    store = {
      "name": "Neighborhood Deli #10",
      "phone_number": "+12065551212",
      "address": "901 Market Street, 6th Floor, San Francisco, CA, 94103"
    }

    stub = stub_request("developer/v1/businesses/#{external_business_id}/stores/#{external_store_id}",
                        response: stub_response(fixture: "business_store/store"),
                        method: :patch,
                        body: store
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    store = client.business_store.update_store(external_business_id: external_business_id,
                                            external_store_id: external_store_id,
                                            **store)

    assert_equal "Neighborhood Deli #10", store.name
  end
  def test_create_store
    token = "fake"
    external_business_id = "a0720d55-7cbe-41ce-8185-58285b7985cd"
    store = {
      "external_store_id": "ed178ef3-b486-4ce8-8baa-5bc9f0f3fa4a",
      "name": "Neighborhood Deli #10",
      "phone_number": "+12065551212",
      "address": "901 Market Street, 6th Floor, San Francisco, CA, 94103"
    }

    stub = stub_request("developer/v1/businesses/#{external_business_id}/stores",
                        response: stub_response(fixture: "business_store/store"),
                        method: :post,
                        body: store
                      )
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    store = client.business_store.create_store(external_business_id: external_business_id,
                                            **store)

    assert_equal "Neighborhood Deli #10", store.name
  end

  # def test_list_stores
  #   token = "fake"
  #   external_business_id = "a0720d55-7cbe-41ce-8185-58285b7985cd"
  #   stub = stub_request("developer/v1/businesses/#{external_business_id}/stores",
  #                       response: stub_response(fixture: "business_store/stores"),
  #                     )
  #   client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
  #   stores = client.business_store.list_stores(external_business_id: external_business_id)

  #   assert_equal RubyDoordash::Stores. stores.class
  # end
end
