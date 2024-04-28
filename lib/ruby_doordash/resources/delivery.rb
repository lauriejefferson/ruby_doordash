module RubyDoordash
  class DeliveryResource < Resource
    def info
      Delivery.new get_request("drive/v2/deliveries/#{external_delivery_id}")
    end
  end
end
