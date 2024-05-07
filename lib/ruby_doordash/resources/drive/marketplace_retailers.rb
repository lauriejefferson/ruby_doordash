module RubyDoordash
  class MarketplaceRetailersResource < Resource
    def add_new_items(**items)
      post_request("api/v2/items", body: items).body
    end

    def update_existing_items(**items)
      patch_request("api/v2/items", body: items).body
    end

    def update_existing_store(store_location_id:, **store)
      patch_request("api/v2/stores/#{store_location_id}", body: store).body
    end

    def add_inventory_pricing(store_location_id: , **items)
      post_request("api/v2/stores/#{store_location_id}/items", body: items).body
    end

    def update_inventory_pricing(store_location_id:, **items)
      patch_request("api/v2/stores/#{store_location_id}/items", body: items).body
    end

    def create_jobs_trigger_pull_requests(**jobs)
      post_request("api/v2/jobs", body: jobs).body
    end
  end
end
