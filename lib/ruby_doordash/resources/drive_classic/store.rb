module RubyDoordash
  module DriveClassic
  class StoreResource < Resouce
   def get_store(external_business_id:, external_store_id:)
    Store.new get_request("developer/v1/businesses/#{external_business_id}/stores/#{external_store_id}").body
   end

   def update_store(external_business_id:, external_store_id: )
    Store.new patch_request("developer/v1/businesses/#{external_business_id}/stores/#{external_store_id}").body
   end

   def create_store(external_business_id:, **store )
    Store.new post_request("developer/v1/businesses/#{external_business_id}/stores", body: store).body
   end

   def list_stores(external_business_id: )
    Store.new get_request("developer/v1/businesses/#{external_business_id}/stores").body
   end
  end
end
end
