=begin
  Created by: Channing Jacobs
  Date: 6/24
  Description: Webscraper to collect information from Stewart's website and
  place it into Award objects. This helps to simplify static site content
  generation.
=end

require_relative "award.rb"
require "mechanize"

class AwardsScraper
  def initialize
    @award_page = Mechanize.new.get("http://web.cse.ohio-state.edu/~stewart.962/awards.vig.html")
    @accomp_page = Mechanize.new.get("http://web.cse.ohio-state.edu/~stewart.962/awards.all.html")
  end

  attr_reader :award_page
  attr_reader :accomp_page
end

# Creat a scraper for the accomplishments and awards pages
scraper = AwardsScraper.new
# Awards list for all awards
awards = [];

# Parse award data into Award objects
award_titles = scraper.award_page.search(".BlockContent-body td b")
titles = award_titles.map {|title| title.text.chomp.gsub(/[[:space:]]/, ' ').strip}
temp = titles.last.split("        ")
titles.push temp[0]
titles.push temp[1]
titles.delete_at(titles.length-3)

award_descrips = scraper.award_page.search(".BlockContent-body td").text.chomp.gsub(/[[:space:]]/, ' ').strip
award_descrips = award_descrips.split(/[ ]{2,}/)
description_list = []
description_list << award_descrips[1,4].reduce(""){|acc, elt| acc + " " + elt}.strip
description_list << award_descrips[6,4].reduce(""){|acc, elt| acc + " " + elt}.strip
description_list << award_descrips[10,2].reduce(""){|acc, elt| acc + " " + elt}.strip.split(")")[1].strip
description_list << award_descrips[12,2].reduce(""){|acc, elt| acc + " " + elt}.strip.split(")")[1].strip
description_list << award_descrips[14,3].reduce(""){|acc, elt| acc + " " + elt}.strip.split("3")[1].strip
description_list << ""
description_list << ""

award_links = Array.new 7
award_links = award_links.map {|link| link = ""}
award_links[1] = scraper.award_page.link_with(text: /Data/).uri.to_s

titles.size.times {|index|
  award = Award.new
  award.title = titles[index]
  award.description = description_list[index]
  award.link = award_links[index]
  awards << award
}

# Parse accomplishment data into Award objects
accomp_list = scraper.accomp_page.search(".entry p")
link_list = scraper.accomp_page.links_with(text: "[more]").map {|link| link.uri.to_s}
accomp_list.size.times {|index|
  award = Award.new
  award.title = accomp_list[index].at("span").text.gsub(/[[:space:]]/, ' ').strip
  raw_description = accomp_list[index].text.chomp
  award.description = raw_description[0,raw_description.length-7].gsub(/[[:space:]]/, ' ')
  award.description.sub!(/((jan|feb).*ary|(sep|oct|nov|dec).*ber|march|april|may|june|july|august) [\d]{4}/i, "")
  award.description = award.description.strip
  award.link = link_list[index]
  awards << award
}


# Dump awards data into a file for use in new webpage (erb loading)
File.write "../data/awards_data", Marshal.dump(awards)
