namespace :dota_scraper do
  desc "TODO"
  task dota_scraper: :environment do

require 'open-uri'
require 'nokogiri'
 
url = "http://dota2.gamepedia.com/Heroes"
page = Nokogiri::HTML(open(url))

page.css('td div a').each do |line|
	puts line.text  # "Spanish" 
    Hero.create(name: line.text)
		end
	end
end
