module EcwidGateway
  module Config

    # Defaultapi domain
    DEFAULT_API_DOMAIN = 'http://127.0.0.1:80'

    # Defailt api token
    DEFAULT_STORE_ID = nil

    # Valid options keys
    VALID_OPTIONS_KEYS = [
      :store_id,
      :api_domain,
      :order_secure_auth_key,
      :sso_secure_auth_key
    ]

    # Valid options accessor
    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    #
    # @return [Hash]
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset config
    #
    # @return [self]
    def reset
      self.store_id   = DEFAULT_STORE_ID
      self.api_domain = DEFAULT_API_DOMAIN
      self
    end

  end
end
