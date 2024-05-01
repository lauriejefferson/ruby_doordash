module RubyDoordash
  class BusinessStoreResource < Resource
   def get_business(external_business_id:)
    BusinessStore.new get_request("developer/v1/businesses/#{external_business_id}").body
   end

   def update_business(external_business_id: , **business)
    BusinessStore.new update_request("developer/v1/businesses/#{external_business_id}", body: business).body
   end

   def create_business(**business)
    BusinessStore.new post_request("developer/v1/businesses", body: business).body

   end

   def list_businesses
    BusinessStore.new get_request("developer/v1/businesses").body
   end

   def get_store

   end

   def update_store

   end

   def create_store

   end

   def list_stores

   end
  end
end
