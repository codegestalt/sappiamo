require './test/test_helper'

class SappiamoAnnotationTest < Minitest::Test

  def setup
    @endpoint = ENV['SAPPIAMO_API_ENDPOINT']
    @access_token = ENV['SAPPIAMO_API_TOKEN']
    @client = Sappiamo.client(endpoint: @endpoint, access_token: @access_token)
  end

  def test_models
    assert Sappiamo::Annotation
    assert Sappiamo::API::Annotations
  end

  def test_all_annotations
    VCR.use_cassette('annotations') do
      annotations = @client.annotations
      assert_equal "A50BF05F-BE7B-450C-A8BA-B626662A664D", annotations.all.first.cAnnotKey
    end
  end

  def test_return_single_annotation
    VCR.use_cassette('annotation') do
      annotation = @client.annotations.find("A50BF05F-BE7B-450C-A8BA-B626662A664D")
      assert_match /Als McDonald’s 1986 auf/, annotation.cAnnotation
    end
  end

end
