require './test/test_helper'

class SappiamoTitleTest < Minitest::Test

  def setup
    @endpoint = ENV['SAPPIAMO_API_ENDPOINT']
    @access_token = ENV['SAPPIAMO_API_TOKEN']
    @client = Sappiamo.client(endpoint: @endpoint, access_token: @access_token)
  end

  def test_all_titles
    VCR.use_cassette('titles') do
      titles = @client.titles
      assert_equal "CD7AD478-7AB3-441F-A5F8-20DEE8E2CE3E", titles.all.first.cProdKey
    end
  end

  def test_return_single_title
    VCR.use_cassette('title') do
      title = @client.titles.find("CD7AD478-7AB3-441F-A5F8-20DEE8E2CE3E")
      assert_equal "Lies und werde reich", title.cProdTitel
    end
  end
end
