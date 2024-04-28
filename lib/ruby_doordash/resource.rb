module RubyDoordash
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end
    def post_request(url, body: {}, headers: {})
      client.connection.get(url, params, headers)
    end
    def patch_request(url, body: {}, headers: {})
      client.connection.get(url, params, headers)
    end
    def put_request(url, body: {}, headers: {})
      client.connection.get(url, params, headers)
    end

    def handle_response(response)
      response
    end
  end
end
