require 'httparty'
require 'hashie'
require 'json'
require 'time'
require 'csv'

require 'ext/array'
require 'ext/hash'
require 'ext/date'
require 'ext/time'

require "sappiamo/version"
require "sappiamo/credentials"
require "sappiamo/errors"
require "sappiamo/base"

require "sappiamo/behavior/crud"

%w(model title annotation author order author_role).each {|a| require "sappiamo/#{a}"}
%w(base titles annotations authors orders author_roles).each {|a| require "sappiamo/api/#{a}"}

module Sappiamo
  class << self
    def client(endpoint: nil, access_token: nil)
      Sappiamo::Base.new(endpoint: endpoint, access_token: access_token)
    end
  end
end
