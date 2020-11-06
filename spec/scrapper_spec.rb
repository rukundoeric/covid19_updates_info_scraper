require_relative '../lib/scraper.rb'

RSpec.describe Scraper do
  let(:scraper) { Scraper.new }
  let(:page_url) { 'https://www.worldometers.info/coronavirus/' }
  let(:output_filename) { 'data/covid19_updates.json' }

  describe '#Set Url' do
    it 'should set the url in the state of the class and return the instance of the class' do
      expect(scraper.set_url(page_url).is_a?(Scraper)).to eq(true)
      expect(scraper.url).to eq(page_url)
    end
  end

  describe '#Set Output file' do
    it 'should set the Output file name in the state of the class and return the instance of the class' do
      expect(scraper.set_output_filename(output_filename).is_a?(Scraper)).to eq(true)
      expect(scraper.output_filename).to eq(output_filename)
    end
  end

  describe '#Scrap' do
    it 'should scrap the data, set data in the state of the class and return its instance' do
      res = scraper
        .set_url('spec/mocks/index.html')
        .set_output_filename(output_filename)
        .scrap

      expect(res.is_a?(Scraper)).to eq(true)
      expect(res.html.nil?).to eq(false)
    end
  end

  describe '#Save' do
    it 'should save the data in file' do
      res = scraper
        .set_url('spec/mocks/index.html')
        .set_output_filename(output_filename)
        .scrap
        .save
      file = File.read(output_filename)
      expect(res['status']).to eq(201)
      expect(JSON.parse(file).is_a?(Array)).to eq(true)
    end
  end
end
