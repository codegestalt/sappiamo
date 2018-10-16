module Sappiamo
  module API
    class Authors < Base

      api_model Sappiamo::Author

      include Sappiamo::Behavior::Crud

      # Retrieves all Authors.
      # @return [Sappiamo::Authors]
      def all(*)
        super
      rescue NotFound => e
        raise NotFound.new(e.response, e.params, "Do you have sufficient privileges?")
      end

    end
  end
end
