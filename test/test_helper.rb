$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sappiamo'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

env = File.join('env.rb')
load(env) if File.exists?(env)

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
  c.filter_sensitive_data("<API_KEY>"){ ENV['SAPPIAMO_API_TOKEN'] }
end
