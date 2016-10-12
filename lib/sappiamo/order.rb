module Sappiamo


  # The model that contains information about a title
  #
  # == Fields
  # TODO: List all fields
  #
  class Order < Hashie::Mash
    include Sappiamo::Model

    api_path '/orders'

  end
end
