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
      DeliveryResource.new(self)
    end

    def business_store
      BusinessStore.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.headers[:accept_encoding] = 'none'
        conn.request :authorization, 'Bearer ', token
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end
