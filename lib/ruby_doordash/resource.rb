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
      handle_response client.connection.post(url, body, headers)
    end
    def patch_request(url, body: {}, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end
    def put_request(url, body: {}, headers: {})
      handle_response client.connection.put(url, body, headers)
    end

    def handle_response(response)
      case response.status
        when 400
          raise Error, "Bad request, request validation failed, request contains invalid arguments
                        or order is not confirmed or has been cancelled. #{response.body["message"]}"
        when 401
          raise Error, "Request unauthorized or request is unathenticated. #{response.body["message"]}"
        when 403
          raise Error, "Operation not unauthorized, not allowed to modify this store, or access is denied. #{response.body["message"]}"
        when 404
          raise Error, "Unknown delivery ID, unknown external business ID, order, item, or options with provided ID does not exist,
                        ,store not found under this external business ID, order data not found. #{response.body["message"]}"
        when 409
          raise Error, "Duplicate delivery ID, Update not allowed or Cancel is not allowed. #{response.body["message"]}"
        when 422
          raise Error, "Delivery is not allowed or request entity too large. #{response.body["message"]}"
        when 424
          raise Error, "Missing dependency to set up stores. #{response.body["message"]}"
        when 429
          raise Error, "Request is rate limited. #{response.body["message"]}"
        when 500
          raise Error, "Internal service failure, please try again later. #{response.body["message"]}"
      end
        response
    end
  end
end
