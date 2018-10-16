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

    # All API actions surrounding Authors
    #
    # @return [Sappiamo::API::Authors]
    def authors
      @authors ||= Sappiamo::API::Authors.new(credentials)
    end

    # All API actions surrounding Transactions
    #
    # @return [Sappiamo::API::Transactions]
    def transactions
      @transactions ||= Sappiamo::API::Transactions.new(credentials)
    end

    # All API actions surrounding Orders
    #
    # @return [Sappiamo::API::Transactions]
    def orders
      @orders ||= Sappiamo::API::Orders.new(credentials)
    end

    # All API actions surrounding AuthorRoles
    #
    # @return [Sappiamo::API::AuthorRoles]
    def author_roles
      @author_roles ||= Sappiamo::API::AuthorRoles.new(credentials)
    end

  end
end
