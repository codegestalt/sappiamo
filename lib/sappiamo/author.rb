module Sappiamo


  # The model that contains information about a Author
  #
  # == Fields
  # TODO: List all fields
  #
  class Author < Hashie::Mash
    include Sappiamo::Model

    api_path '/authors'

  end
end
