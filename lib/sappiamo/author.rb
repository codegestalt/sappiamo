module Sappiamo
  class Author < Hashie::Mash
    include Sappiamo::Model

    api_path '/authors'
  end
end
