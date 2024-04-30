require './test/test_helper'

class DeliveryResourceTest < Minitest::Test
  def test_info
    external_delivery_id = 'D-1763'
    token = "fake"
    stub = stub_request("deliveries/#{external_delivery_id}", response: stub_response(fixture: "delivery/info"))
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    delivery = client.delivery.info(external_delivery_id: external_delivery_id)

    assert_equal RubyDoordash::Delivery, delivery.class
    assert_equal "D-1763", delivery.dig('external_delivery_id')
  end
end
