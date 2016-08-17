module Sappiamo
  module Behavior
    module Crud
      # Retrieves all items
      # @return [Array<Sappiamo::BaseModel>] an array of models
      def all(user = nil, query_options = {})
        query = query_options
        response = request(:get, credentials, api_model.api_path, :query => query)
        api_model.parse(response.parsed_response)
      end

      # Retrieves an item by id
      # @overload find(id)
      #   @param [String] the id of the item you want to retreive
      def find(id)
        raise "id required" unless id
        response = request(:get, credentials, "#{api_model.api_path}/#{id}")
        api_model.parse(response.parsed_response).first
      end

    end
  end
end
