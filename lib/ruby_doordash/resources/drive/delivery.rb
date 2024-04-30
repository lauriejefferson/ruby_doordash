module RubyDoordash
  class DeliveryResource < Resource
    def get_delivery(external_delivery_id:)
      Delivery.new get_request("drive/v2/deliveries/#{external_delivery_id}").body
    end

    def create_quote(body:)
      Delivery.new post_request("drive/v2/quotes").body
    end

    def accept_quote()

    end

    def create_delivery()

    end

    def update_delivery()

    end

    def cancel_delivery()

    end
  end
end
