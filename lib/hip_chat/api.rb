require_relative "common_methods"
require_relative "user"
require_relative "relation"

module HipChat
  class Api
    include CommonMethods

    attr_reader :token, :users

    def initialize(token)
      @token = token
      validate_token
    end

    def refresh_users
      response = get_request(User::URL, auth_hash)
      users_list = validate_response(response)["items"]

      @users = Relation.new(token, users_list, User)
    end

    private

    def validate_token
      refresh_users
    end
  end
end
