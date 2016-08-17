require './test/test_helper'

class SappiamoClientTest < Minitest::Test

  def setup
    @endpoint = ENV['SAPPIAMO_API_ENDPOINT']
    @access_token = ENV['SAPPIAMO_API_TOKEN']
  end

  def test_models
    assert Sappiamo::Title
    assert Sappiamo::API::Titles
  end

  def test_empty_client_raises_runtime_error
    assert_raises RuntimeError do
      client = Sappiamo.client()
    end
  end

  def test_initialize_client

    client = Sappiamo.client(endpoint: @endpoint, access_token: @access_token)

    assert_equal Sappiamo::Base, client.class
    assert_equal Sappiamo::OAuthCredentials, client.credentials.class
    assert_equal @endpoint, client.credentials.host
    assert_equal @access_token, client.credentials.access_token
  end

end
