module Sappiamo
  module API
    class Transactions < Base

      api_model Sappiamo::Transaction

      include Sappiamo::Behavior::Crud

      # Retrieves all Transactions.
      # @return [Sappiamo::Transaction]
      def all(*)
        super
      rescue NotFound => e
        raise NotFound.new(e.response, e.params, "Do you have sufficient privileges?")
      end

    end
  end
end
