module Sappiamo
  module API
    class AuthorRoles < Base

      api_model Sappiamo::AuthorRole

      include Sappiamo::Behavior::Crud

      # Retrieves all AuthorRoles.
      # @return [Sappiamo::AuthorRole]
      def all(*)
        super
      rescue NotFound => e
        raise NotFound.new(e.response, e.params, "Do you have sufficient privileges?")
      end

    end
  end
end
