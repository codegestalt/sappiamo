module Sappiamo


  # The model that contains information about a Address
  #
  # == Fields
  # TODO: List all fields
  #
  class Address < Hashie::Mash
    include Sappiamo::Model

    api_path '/addresses'

  end
end
