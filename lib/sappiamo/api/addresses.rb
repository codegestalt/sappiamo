module Sappiamo
  module API
    class Addresses < Base

      api_model Sappiamo::Address

      include Sappiamo::Behavior::Crud

      # Retrieves all Annotations.
      # @return [Sappiamo::Annotation]
      def all(*)
        super
      rescue NotFound => e
        raise NotFound.new(e.response, e.params, "Do you have sufficient privileges?")
      end

    end
  end
end
