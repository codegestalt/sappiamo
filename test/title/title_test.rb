require './test/test_helper'

class SappiamoTitleTest < Minitest::Test
  def test_exists
    assert Sappiamo::Title
  end

  def test_returns_single_title
    VCR.use_cassette('one_title') do
      title = Sappiamo::Title.find("00366E69-16A4-44EE-8F41-AD2B5C9BA44B")
      assert_equal Sappiamo::Title, title.class

      assert_equal "00366E69-16A4-44EE-8F41-AD2B5C9BA44B", title.id
      assert_equal "P1600621", title.product_nr

      assert_equal "Veltliner Fussreisen", title.title
      assert_equal "Zwischen Bündnerpässen und Bergamasker Alpen", title.subtitle
      assert_equal "Bauer/Frischknecht, Veltliner Fu\u00dfreisen", title.description

      assert_equal "DE", title.language

      assert_equal "10.07.2007", title.published
      assert_equal 414, title.pages

      assert_equal "Lesewanderbuch", title.category
      assert_equal "1600", title.category_code

      assert_equal "9783858693495", title.ean

      assert_equal "978-3-85869-349-5", title.isbn

      assert_equal 780, title.stock_ch
      assert_equal nil, title.stock_de

      assert_equal 19.9, title.price_chf
      assert_equal 17.5, title.price_eur

      assert_equal "4., Aufl. 10.07.2007", title.edition_text
    end
  end
end
