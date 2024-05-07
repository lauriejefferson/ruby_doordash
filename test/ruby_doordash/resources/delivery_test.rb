require './test/test_helper'

class DeliveryResourceTest < Minitest::Test
  def test_info
    external_delivery_id = 'D-1763'
    token = "fake"
    stub = stub_request("deliveries/#{external_delivery_id}", response: stub_response(fixture: "delivery/delivery"))
    client = RubyDoordash::Client.new(token: token, adapter: :test, stubs: stub)
    # delivery = client.delivery.get_delivery(external_delivery_id: external_delivery_id)

    puts client.delivery.inspect
  end
end
