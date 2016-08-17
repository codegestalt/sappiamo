module Sappiamo


  # The model that contains information about a title
  #
  # == Fields
  # TODO: List all fields
  #
  class Title < Hashie::Mash
    include Sappiamo::Model

    api_path '/titles'

  end
end
