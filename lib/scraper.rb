# Author: Mike
# Created: 6/24
# Edit: N/A

require_relative "Publication_scraper"

#Provide the urls for scraping
urls = ['http://web.cse.ohio-state.edu/~stewart.962/publications.full.html','http://web.cse.ohio-state.edu/~stewart.962/publications.tr.html']

#Initialize the variables
agent = Mechanize.new
scraper = Publication_scraper.new
data = Hash.new{|h,k| h[k] = []} 

#Parse all urls and scrape into data
urls.each{
	|url|
	page = agent.get(url)
	scraper.get_all_data data, page
}

#puts JSON.pretty_generate(data).gsub(":", " =>")

#Clear data.default_proc for Marshal dump
data.default_proc = nil

#Dump and store the data in ../data/publication_data
File.write "../data/publication_data", Marshal.dump(data)