module Sappiamo
  class Base
    attr_reader :request, :credentials

    def initialize(endpoint: nil, access_token: nil)
      @credentials = if access_token && endpoint
         OAuthCredentials.new(endpoint, access_token)
      else
        fail 'You must provide an :endpoint and :access_token'
      end
    end

    # All API actions surrounding Titles
    #
    # @return [Sappiamo::API::Titles]
    def titles
      @titles ||= Sappiamo::API::Titles.new(credentials)
    end

    # All API actions surrounding Annotations
    #
    # @return [Sappiamo::API::Annotations]
    def annotations
      @titles ||= Sappiamo::API::Annotations.new(credentials)
    end

    # All API actions surrounding Addresses
    #
    # @return [Sappiamo::API::Addresses]
    def addresses
      @addresses ||= Sappiamo::API::Addresses.new(credentials)
    end

    # All API actions surrounding Transactions
    #
    # @return [Sappiamo::API::Transactions]
    def transactions
      @transactions ||= Sappiamo::API::Transactions.new(credentials)
    end

  end
end
