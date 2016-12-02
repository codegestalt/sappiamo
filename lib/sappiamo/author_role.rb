module Sappiamo


  # The model that contains information about an Author Role
  #
  # == Fields
  # TODO: List all fields
  #
  class AuthorRole < Hashie::Mash
    include Sappiamo::Model

    api_path '/author_roles'

  end
end
