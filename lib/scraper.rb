require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'json'

# rubocop: disable Naming/AccessorMethodName

# Scraper class
class Scraper
  attr_reader :url, :output_filename, :html
  def initialize
    @output_filename = 'data/covid19_updates.json'
  end

  def set_url(url)
    @url = url
    self
  end

  def set_output_filename(filename)
    @output_filename = filename
    self
  end

  def scrap
    @html = Nokogiri::HTML(URI.open(@url))
    @table = @html.css('table#main_table_countries_today')
    @keys = headers
    @data = collect_data
    self
  rescue StandardError => e
    e
  end

  def headers
    result = []
    data = @table.css('thead').css('tr').css('th')
    data.collect do |cell|
      result << cell.text
    end
    result
  end

  def collect_data
    result = []
    data = @table.css('tbody').first.css('tr')
    data.collect do |row|
      item = {}
      i = 0
      row.css('td').collect do |col|
        item[@keys[i]] = col.text
        i += 1
      end
      result << item
    end
    result
  end

  def save
    File.write(@output_filename, JSON.pretty_generate(@data))
    responce = {
      'status' => 201,
      'responce_message' => 'Data Scrapped and Saved Successfully!!'
    }
    responce
  rescue StandardError => e
    e
  end
end
# rubocop: enable Naming/AccessorMethodName
