module RubyDoordash
  class Client
    BASE_URL = 'https://openapi.doordash.com/'.freeze

    attr_reader :token, :adapter

   def initialize(token, adapter: Faraday.default_adapter, stubs: nil)
      @token = token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, token
        conn.request :json
        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end
