module RubyDoordash
  class MarketplaceRetailersResource < Resource
    def add_new_items(**items)
     BatchAddOrUpdateItemRequest.new post_request("api/v2/items", body: items).body
    end

    def update_existing_items(**items)
     BatchAddOrUpdateItemRequest.new patch_request("api/v2/items", body: items).body
    end

    def update_existing_store(store_location_id:, **store)
      ExistingStore.new patch_request("api/v2/stores/#{store_location_id}", body: store).body
    end

    def add_inventory_pricing(store_location_id: , **items)
      StoreItem.new post_request("api/v2/stores/#{store_location_id}/items", body: items).body
    end

    def update_inventory_pricing(store_location_id:, **items)
      OperationStatus.new patch_request("api/v2/stores/#{store_location_id}/items", body: items).body
    end

    def create_jobs_trigger_pull_requests(**job_request)
      OperationStatus.new post_request("api/v2/jobs", body: job_request).body
    end
  end
end
