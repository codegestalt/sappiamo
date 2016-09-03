require './test/test_helper'

class SappiamoAddressTest < Minitest::Test

  def setup
    @endpoint = ENV['SAPPIAMO_API_ENDPOINT']
    @access_token = ENV['SAPPIAMO_API_TOKEN']
    @client = Sappiamo.client(endpoint: @endpoint, access_token: @access_token)
  end

  def test_models
    assert Sappiamo::Address
    assert Sappiamo::API::Addresses
  end

  def test_all_addresses
    VCR.use_cassette('addresses') do
      addresses = @client.addresses
      assert_equal "C4839FB5-C201-4FFB-A95E-9B24BC965DDD", addresses.all.first.cAdressKey
    end
  end

  def test_return_single_address
    VCR.use_cassette('address') do
      address = @client.addresses.find("C4839FB5-C201-4FFB-A95E-9B24BC965DDD")
      assert_match /markus.schaer@gmx.net/, address.cEMail
    end
  end

end
