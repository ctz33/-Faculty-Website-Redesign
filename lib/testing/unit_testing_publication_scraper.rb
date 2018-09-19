=begin
	Author: Mike
	Date created: 6/24
	Edit: N/A

	Test plan for testing Publication class:
	1. parse abbr, link and year from page1 no event_link
	2. parse abbr, link and year from page1 no event_link
	3. parse  abbr, link and year from page1, normal
	4. parse abbr, link and year from page1 no year
	5. parse abbr, link and year from page2 no year
	6. parse pdf link from page1, normal
	7. parse pdf link from page2, normal
	8, parse pdf link from page1, no link
	9, parse ppt link from page1, normal
	10, parse ppt link from page2, normal
	11, parse ppt link from page1, no link
	12, parse bibtex link from page1, normal
	13, parse bibtex link from page2, normal
	14, parse title, author, eventname, location from page1, normal
	15, parse title, author, eventname, location from page2, normal
	16, parse title, author, eventname, location from page1, special case
	17, test get_all_data

=end

require 'mechanize'
require_relative "../publication_scraper"
require_relative "../publication"
require "test/unit"

class TestPublication < Test::Unit::TestCase

	url1 = 'http://web.cse.ohio-state.edu/~stewart.962/publications.full.html'
	url2 = 'http://web.cse.ohio-state.edu/~stewart.962/publications.tr.html'
	agent = Mechanize.new
	$scraper = Publication_scraper.new
	$page1 = agent.get(url1)
	$page2 = agent.get(url2)

	def test_parse_abbr_link_year_1
		pub = Publication.new
		smalls = $page1.search('.entry>small')
		$scraper.parse_abbr_link_year pub,smalls[0]

		assert_equal "EuroSys", pub.event_abbr
		assert_equal "",pub.event_link
		assert_equal "2018",pub.year
	end

	def test_parse_abbr_link_year_2
		pub = Publication.new
		smalls = $page1.search('.entry>small')
		$scraper.parse_abbr_link_year pub,smalls[1]

		assert_equal "IOTDI", pub.event_abbr
		assert_equal "",pub.event_link
		assert_equal "2018",pub.year
	end

	def test_parse_abbr_link_year_3
		pub = Publication.new
		smalls = $page1.search('.entry>small')
		$scraper.parse_abbr_link_year pub,smalls[2]

		assert_equal "FiE", pub.event_abbr
		assert_equal "http://fie2018.org",pub.event_link
		assert_equal "2018",pub.year
	end

	def test_parse_abbr_link_year_4
		pub = Publication.new
		smalls = $page1.search('.entry>small')
		$scraper.parse_abbr_link_year pub,smalls[15]

		assert_equal "ASPLOS WACI", pub.event_abbr
		assert_equal "http://asplos15.bilkent.edu.tr/waci.html",pub.event_link
		assert_equal 0,pub.year
	end

	def test_parse_abbr_link_year_5
		pub = Publication.new
		smalls = $page2.search('.entry>small')
		$scraper.parse_abbr_link_year pub,smalls[0]

		assert_equal "Thesis", pub.event_abbr
		assert_equal "https://gradsch.osu.edu/calendar/events/scaling-analytics-through-approximate-and-distributed-computing",pub.event_link
		assert_equal 0,pub.year
	end

	def test_parse_pdf_link_1
		pub = Publication.new
		pdf_ppt_bib = $page1.search('.entry>a')
		$scraper.parse_pdf_link pub,pdf_ppt_bib[0]

		assert_equal "http://www.cse.ohio-state.edu/~cstewart/Papers/morris2018modeldriven.pdf",pub.pdf_link
	end

	def test_parse_pdf_link_2
		pub = Publication.new
		pdf_ppt_bib = $page2.search('.entry>a')
		$scraper.parse_pdf_link pub,pdf_ppt_bib[0]

		assert_equal "http://www.cse.ohio-state.edu/~cstewart/Papers/chakrabarti2017thesis.pdf",pub.pdf_link
	end

	def test_parse_pdf_link_3
		pub = Publication.new
		pdf_ppt_bib = $page1.search('.entry>a')
		$scraper.parse_pdf_link pub,pdf_ppt_bib[117]

		assert_equal "",pub.pdf_link
	end

	def test_parse_ppt_link_1
		pub = Publication.new
		pdf_ppt_bib = $page1.search('.entry>a')
		$scraper.parse_ppt_link pub,pdf_ppt_bib[1]

		assert_equal "http://www.cse.ohio-state.edu/~cstewart/Papers/morris2018modeldriven-slides.pdf",pub.ppt_link
	end

	def test_parse_ppt_link_2
		pub = Publication.new
		pdf_ppt_bib = $page2.search('.entry>a')
		$scraper.parse_ppt_link pub,pdf_ppt_bib[1]

		assert_equal "http://www.cse.ohio-state.edu/~cstewart/Papers/chakrabarti2017thesis-pres.pdf",pub.ppt_link
	end

	def test_parse_ppt_link_3
		pub = Publication.new
		pdf_ppt_bib = $page1.search('.entry>a')
		$scraper.parse_ppt_link pub,pdf_ppt_bib[8]

		assert_equal "",pub.ppt_link
	end


	def test_parse_bib_link_1
		pub = Publication.new
		pdf_ppt_bib = $page1.search('.entry>a')
		$scraper.parse_bib_link pub,pdf_ppt_bib[2]

		assert_equal "http://web.cse.ohio-state.edu/~stewart.962/bibtex/morris2018modeldriven",pub.bibtex_link
	end

	def test_parse_bib_link_2
		pub = Publication.new
		pdf_ppt_bib = $page2.search('.entry>a')
		$scraper.parse_bib_link pub,pdf_ppt_bib[2]

		assert_equal "http://web.cse.ohio-state.edu/~stewart.962/bibtex/chakrabarti2017thesis",pub.bibtex_link
	end

	def test_title_author_eventname_location_1
		pub = Publication.new
		info = $page1.search('.entry>big')
		$scraper.parse_title_author_eventname_location pub,info[0]

		assert_equal "2018",pub.year
		assert_equal "Model-driven Computational Sprinting",pub.title
		assert_equal "Nathaniel Morris and Christopher Stewart and Lydia Chen and Robert Birke and Jaimie Kelley",pub.author_str
		assert_equal ["Nathaniel Morris","Christopher Stewart","Lydia Chen","Robert Birke","Jaimie Kelley"],pub.author_list
		assert_equal "ACM European Conference on Computer Systems",pub.event_name
		assert_equal "Porto, Portugal",pub.location
	end

	def test_title_author_eventname_location_2
		pub = Publication.new
		info = $page2.search('.entry>big')
		$scraper.parse_title_author_eventname_location pub,info[0]

		assert_equal "2017",pub.year
		assert_equal "Scaling Analytics through Approximate and Distributed Computing",pub.title
		assert_equal "Aniket Chakrabarti",pub.author_str
		assert_equal ["Aniket Chakrabarti"],pub.author_list
		assert_equal "OSU Masters Thesis",pub.event_name
		assert_equal "Columbus, OH USA",pub.location
	end

	def test_title_author_eventname_location_3
		pub = Publication.new
		info = $page1.search('.entry>big')
		$scraper.parse_title_author_eventname_location pub,info[76]

		assert_equal "2007",pub.year
		assert_equal "AutoParam: Automated Control of Application-Level Performance in Virtualized Server Environments",pub.title
		assert_equal "Zhikui Wang, Xue Liu, Alex Zhang, Christopher Stewart, Xiaoyun Zhu, and Terence Kelly",pub.author_str
		assert_equal ["Zhikui Wang","Xue Liu","Alex Zhang","Christopher Stewart","Xiaoyun Zhu","Terence Kelly"],pub.author_list
		assert_equal "Feedback Control Implementation and Design in Computing Systems and Networks",pub.event_name
		assert_equal "Munich, Germany",pub.location
	end

	def test_get_all_data
		pub = Publication.new
		data = Hash.new{|h,k| h[k] = []}
		$scraper.get_all_data data, $page1

		assert_equal 15, data.length
		assert_equal 1, data["2010"].length
		assert_equal "EntomoModel: Understanding and Avoiding Performance Anomaly Manifestations (winner of Best Paper Award)",data["2010"][0].title
		assert_equal ["Christopher Stewart", "Kai Shen", "Arun Iyengar", "Jian Yin"], data["2010"][0].author_list
		assert_equal "IEEE Symposium on Modeling, Analysis and Simulation of Computer and Telecommunication Systems", data["2010"][0].event_name
		assert_equal "Miami Beach, FL", data["2010"][0].location
		assert_equal "http://www.cse.ohio-state.edu/~cstewart/Papers/stewartmascots10.pdf",data["2010"][0].pdf_link
		assert_equal "http://www.cse.ohio-state.edu/~cstewart/Papers/stewartmascots10-pres.pdf",data["2010"][0].ppt_link
		assert_equal "http://web.cse.ohio-state.edu/~stewart.962/bibtex/stewart2010entomomodel",data["2010"][0].bibtex_link
		assert_equal "http://mascots2010.cis.fiu.edu/",data["2010"][0].event_link
	end

end
