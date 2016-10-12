module Sappiamo
  module API
    class Orders < Base

      api_model Sappiamo::Order

      include Sappiamo::Behavior::Crud
      #
      # Retrieves all Orders.
      # @return [Sappiamo::Title]
      def all(*)
        super
      rescue NotFound => e
        raise NotFound.new(e.response, e.params, "Do you have sufficient privileges?")
      end

      # Creates an item
      # @param [Sappiamo::Order] model the item you want to create
      # @return [Sappiamo::Order]
      def create(model)
        model = api_model.wrap(model)
        response = request(:post, credentials, "#{api_model.api_path}", :body => model.to_json)
        id = JSON.parse(response.body)['order']['cVKKey']
        find(id)
      end

    end
  end
end

