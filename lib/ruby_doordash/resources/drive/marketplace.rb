module RubyDoordash
  module Drive
    class MarketplaceResource < Resource
      def create_menu(**menu)
        Reference.new post_request("api/v1/menus", body: menu).body
      end

      def update_menu(id:, **menu)
        Reference.new patch_request("api/v1/menus/#{id}", body: menu).body
      end

      def confirm_order(id:, **order)
        patch_request("api/v1/orders/#{id}", body: order).body
      end

      def cancel_adjust_substitue_items(id:, **items)
        patch_request("api/v1/orders/#{id}/adjustment", body: items).body
      end

      def cancel_order(id:, **cancellation)
        patch_request("api/v1/orders/#{id}/cancellation", body: cancellation).body
      end

      def cancel_order_events(id:, event_type:, **merchant)
        patch_request("api/v1/orders/#{id}/events/#{event_type}", body: merchant).body
      end

      def get_store_info(location_id:)
        StoreDetails.new get_request("api/v1/stores/#{location_id}/store_details").body
      end

      def activate_deactivate_store(location_id:, **status)
        put_request("api/v1/stores/#{location_id}/status", body: status).body
      end

      def activate_deactivate_item(merchant_supplied_id:, **merchant)
        put_request("api/v1/stores/#{merchant_supplied_id}/items/status", body: merchant).body
      end

      def get_store_menu_details(merchant_supplied_id: )
        StoreMenu.new get_request("api/v1/stores/#{merchant_supplied_id}/menu_details").body
      end

      def get_store_menu_jsons(merchant_supplied_id: )
        get_request("api/v1/stores/#{merchant_supplied_id}/store_menu").body
      end
    end
  end
end
