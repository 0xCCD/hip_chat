require "httparty"
require_relative "error"

module HipChat
  module CommonMethods
    BASE_URL = "http://api.hipchat.com/v2/"

    OK_CODES = [
      200,
      201,
      204
    ]

    private

    def auth_hash
      {auth_token: token}
    end

    def get_request(url, query_hash)
      HTTParty.get(url, query: auth_hash.merge(query_hash))
    end

    def put_request(url, data)
      put_or_post_data(:put, url, data)
    end

    def post_request(url, data)
      put_or_post_data(:post, url, data)
    end

    def put_or_post_data(type, url, data)
      HTTParty.public_send(type, url, {
        body: data.to_json,
        headers: {'Content-Type' => 'application/json'},
        query: auth_hash
      })
    end

    def deletion_request(url)
      HTTParty.delete(url, query: auth_hash)
    end

    def validate_response(response)
      body = response.body
      body_hash = JSON.parse(response.body) if body

      if OK_CODES.include?(response.code)
        body_hash
      else
        error = body_hash["error"]
        raise Error.new(error)
      end
    end

  end
end
