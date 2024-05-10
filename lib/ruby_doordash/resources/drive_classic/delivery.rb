module RubyDoordash
  module DriveClassic
    class DeliveryResource < Resource
      def create_delivery_estimate(**estimate)
        Estimate.new post_request("drive/v1/estimates", body: estimate).body
      end

      def create_delivery_validation(**validation)
        Validation.new post_request("drive/v1/validations", body: validation).body
      end

      def create_delivery(**delivery)
        Delivery.new post_request("drive/v1/deliveries", body: delivery).body
      end

      def get_delivery_details(delivery_id: )
        Delivery.new get_request("drive/v1/deliveries/#{delivery_id}").body
      end

      def update_delivery(delivery_id: , **delivery)
        Delivery.new patch_request("drive/v1/deliveries/#{delivery_id}", body: delivery).body
      end

      def cancel_delivery(delivery_id: , **reason)
        DeliveryCancellation.new put_request("drive/v1/deliveries/#{delivery_id}/cancel", body: reason).body
      end
    end
  end
end
