module Sappiamo
  class Annotation < Hashie::Mash
    include Sappiamo::Model

    api_path '/annotations'
  end
end

