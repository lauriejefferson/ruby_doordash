module RubyDoordash
  module DriveClassic
  class BusinessResource < Resource
   def get_business(external_business_id:)
    Business.new get_request("developer/v1/businesses/#{external_business_id}").body
   end

   def update_business(external_business_id: , **business)
    Business.new update_request("developer/v1/businesses/#{external_business_id}", body: business).body
   end

   def create_business(**business)
    Business.new post_request("developer/v1/businesses", body: business).body
   end

   def list_businesses
    Business.new get_request("developer/v1/businesses").body
   end
  end
end
end
