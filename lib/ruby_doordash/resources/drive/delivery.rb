module RubyDoordash
  class DeliveryResource < Resource
    def get_delivery(external_delivery_id:)
      Delivery.new get_request("drive/v2/deliveries/#{external_delivery_id}").body
    end

    def create_quote(**quote)
      Delivery.new post_request("drive/v2/quotes", body: quote).body
    end

    def accept_quote(external_delivery_id:, **accept_quote )
      Delivery.new post_request("drive/v2/quotes/#{external_delivery_id}/accept", body: accept_quote).body
    end

    def create_delivery(**delivery)
      Delivery.new post_request('drive/v2/deliveries', body: delivery)
    end

    def update_delivery(external_delivery_id:, **delivery)
      Delivery.new patch_request("drive/v2/deliveries/#{external_delivery_id}", body: delivery).body
    end

    def cancel_delivery(external_delivery_id:)
      Delivery.new put_request("drive/v2/deliveries/#{external_delivery_id}/cancel", body: {}).body
    end
  end
end
