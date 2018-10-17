module Sappiamo
  class Title < Hashie::Mash
    include Sappiamo::Model

    api_path '/titles'
  end
end
