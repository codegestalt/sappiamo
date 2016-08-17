module Sappiamo
  module API
    class Titles < Base

      api_model Sappiamo::Title

      include Sappiamo::Behavior::Crud
      #
      # Retrieves all Titles.
      # @return [Sappiamo::Title]
      def all(*)
        super
      rescue NotFound => e
        raise NotFound.new(e.response, e.params, "Do you have sufficient privileges?")
      end

    end
  end
end
