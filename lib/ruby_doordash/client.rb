module RubyDoordash
  class Client
    BASE_URL = 'https://openapi.doordash.com/'

    attr_reader :token, :adapter

    def initialize(token:, adapter: Faraday.default_adapter, stubs: nil)
      @token = token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def delivery
      Drive::DeliveryResource.new(self)
    end

    def delivery_classic
      DriveClassic::DeliveryResource.new(self)
    end

    def business_store
      DriveClassic::BusinessStoreResource.new(self)
    end

    def marketplace
      Drive::MarketplaceResource.new(self)
    end

    def marketplace_retailers
      Drive::MarketplaceRetailersResource.new(self)
    end

    def marketplace_legacy
      DriveClassic::MarketplaceLegacy.new(self)
    end

    def reporting
      DriveClassic::Reporting.new(self)
    end
    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.headers[:accept_encoding] = 'none'
        conn.request :authorization, :Bearer, token
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end
