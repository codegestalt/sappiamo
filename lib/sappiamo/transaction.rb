module Sappiamo

  class Transaction < Hashie::Mash
    include Sappiamo::Model

    api_path '/transactions'

  end
end
