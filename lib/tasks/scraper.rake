namespace :scraper do
  desc "Scraper"
  task scrape: :environment do

    require 'open-uri'
    require 'nokogiri'
    require 'csv'
    require 'json'

    url = "https://en.wikipedia.org/wiki/List_of_languages_by_number_of_native_speakers"
    page = Nokogiri::HTML(open(url))  
    page.css('td b a').each do |line|
      puts line.text  # "Spanish" 
      Language.create(language: line.text)
    end
  end
end