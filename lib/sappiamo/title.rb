require 'faraday'
require 'json'

API_URL = "http://159.100.248.244:3000/api/v1/titles"

CONN = Faraday::Connection.new API_URL

module Sappiamo
  class Title

    attr_reader :id, :product_nr, :title, :subtitle, :description, :language,
                :published, :pages, :category, :category_code, :ean, :isbn,
                :stock_ch, :stock_de, :price_chf, :price_eur, :edition_text

    def initialize(attributes)
      @id = attributes["cProdKey"].strip
      @product_nr = attributes["cProduktNr"].strip

      @title = attributes["cProdTitel"].strip
      @subtitle = attributes["cUnterTitel"].strip
      @description = attributes["cProdKurzbez"].strip

      @language = attributes["cPublSprache"].strip
      @published = attributes["cErschTermin"].strip
      @pages = attributes["nAnzahlSeiten"]

      @category = attributes["cPrGrBez"].strip
      @category_code = attributes["cPrGrCde"].strip

      @ean = attributes["EAN"].strip
      @isbn = attributes["ISBN"].strip

      @stock_ch = attributes["LagerbestandCH"]
      @stock_de = attributes["LagerbestandDE"]

      @price_chf = attributes["VP_CHF"].to_f
      @price_eur = attributes["VP_EUR"].to_f

      @edition_text = attributes["cAuflagenText"].strip

    end

    def self.find(id)
      CONN.authorization :Token, :token => ENV['SAPPIAMO_API_TOKEN']
      response = CONN.get(id)
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def authors

    end

  end
end
