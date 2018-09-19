=begin
	Author: Channing Jacobs
	Date created: 6/25
	Edit: N/A

	Test plan for testing Awards class:
	Favorite Awards:
	1. Award with only title
	2. Award with title and description
	3. Award with title, description, and link
	Other Awards:
	1. Award with title, description, and link

=end

require_relative "../award"
require "test/unit"

class TestAwards < Test::Unit::TestCase

	$awards = Marshal.load File.read("../../data/awards_data")

	# Favorite Awards
	def test_fav_award_title_only
		assert_equal "Provost Fellowship, University of Rochester, 2003", $awards[5].title
		assert_equal "", $awards[5].description
		assert_equal "", $awards[5].link
	end

	def test_fav_award_title_descript
		assert_equal "Revision Path Interview (2014)", $awards[0].title
		assert_equal "RevisionPath highlights young, black leaders in technology. In September 2014, Dr. Stewart was highlighted. Joining a list of acclaimed technologists, e.g., Frederick Townes (founder of Mashable) and Kevin Johnson (CEO of Johnson Media).", $awards[0].description
		assert_equal "", $awards[0].link
	end

	def test_fav_award_title_descript_link
		assert_equal "NSF CAREER Award (2014)", $awards[1].title
		assert_equal "As Internet services scale out their energy and carbon footprints increase. Unfortunately, to keep energy costs low, datacenters are often located in places with cheap but dirty energy sources---excacerbating carbon footprints. Our idea, Greening as a Service, uses renewable energy credits or carbon offsets to eliminate carbon footprints for only users that explicitly request clean-powered service. Datagreening.com is one of our first prototypes of a greening service (for email).", $awards[1].description
		assert_equal "https://www.datagreening.com", $awards[1].link
	end
	# Other Awards
	def test_oth_award_title_descript_link
		assert_equal "April 2016", $awards[7].title
		assert_equal "Our Infocom 2016 paper was given the Best-In-Session Presentation Award.", $awards[7].description
		assert_equal "http://web.cse.ohio-state.edu/~cstewart/Papers/xu2016blending.pdf", $awards[7].link
	end


end
