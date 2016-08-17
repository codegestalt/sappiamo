module Sappiamo


  # The model that contains information about an annotation
  #
  # == Fields
  # TODO: List all fields
  #
  class Annotation < Hashie::Mash
    include Sappiamo::Model

    api_path '/annotations'

  end
end

