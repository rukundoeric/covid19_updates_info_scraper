require_relative './scraper.rb'

# Covidinfo Class
class Covidinfo
  def initialize
    @file = File.read('data/covid19_updates.json')
    @data = JSON.parse(@file)
  end

  def get_country_information(country)
    result = @data.select { |item| item['Country,Other'].upcase == country.upcase }
    JSON.pretty_generate(result)
  end

  def get_list_with_information(num = nil)
    JSON.pretty_generate(@data) unless num

    JSON.pretty_generate(@data[0..num])
  end

  def update_information
    page_url = 'https://www.worldometers.info/coronavirus/'
    output_filename = 'data/covid19_updates.json'
    scrapper = Scraper.new
    responce =
      scrapper
        .set_url(page_url)
        .set_output_filename(output_filename)
        .scrap
        .save
    responce
  end
end
