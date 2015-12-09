require_relative "common_methods"

module HipChat
  class User
    include CommonMethods

    URL = "#{BASE_URL}user"

    ATTRIBUTES = %w{
      client
      created
      email
      group
      id
      idle
      is_deleted
      is_group_admin
      is_guest
      is_online
      last_active
      links
      mention_name
      name
      password
      photo_url
      presence
      show
      status
      timezone
      title
      token
      type
      version
      xmpp_jid
    }

    attr_accessor *ATTRIBUTES

    class << self
      # finder can be {id: id}, {email: email}, or {mention_name: mention_name}

      def find(token, finder)
        self.new(token, finder, fetch_details: true)
      end

      def create!(token, attributes)
        new(token, attributes).tap(&:save!)
      end

      def create(token, attributes)
        begin
          create!(token, attributes)
        rescue Error
          false
        end
      end
    end

    def details
      response = get_request(url, auth_hash)
      properties_hash = validate_response(response)
      set_properties(properties_hash)
    end

    def save!
      if id.nil?
        response = post_request(URL, hash_for_update)
        validate_response(response)
        true
      else
        update!
      end
    end

    def update!
      response = put_request(url, hash_for_update)
      validate_response(response)
      details
      true
    end

    def destroy!
      response = deletion_request(url)
      validate_response(response)
      true
    end

    {
      destroy: "destroy!",
      save: "save!",
      update: "update!"
    }.each do |rescuer, breaker|
      define_method rescuer do
        begin
          send(breaker)
        rescue Error => @error
          false
        end
      end
    end

    private

    def initialize(token, properties_hash, opts={})
      @token = token
      set_properties(properties_hash)
      details if opts[:fetch_details]
    end

    def url
      attribute = id || email || "@#{mention_name}"
      "#{URL}/#{attribute}"
    end

    def set_properties(hash)
      hash.each do |key, value|
        var_name = "@#{key}"
        self.instance_variable_set(var_name, value)
      end

      self
    end

    def hash_for_update
      {}.tap do |hash|
        ATTRIBUTES.each do |method|
          value = public_send(method)
          hash[method] = value if value
        end
      end
    end
  end
end
