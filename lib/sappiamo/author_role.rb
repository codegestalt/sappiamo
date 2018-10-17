module Sappiamo
  class AuthorRole < Hashie::Mash
    include Sappiamo::Model

    api_path '/author_roles'
  end
end
