=begin
  Created by: Channing Jacobs
  Date: 6/24
  Description: Award object to hold data parsed from Stewart's original
  website.
=end
class Award
  def initialize
    # title of award
    @title = ""
    # paragraph describing award
    @description = ""
    # link to further award information
    @link = ""
  end

  attr_accessor :title
  attr_accessor :description
  attr_accessor :link
  attr_accessor :priority

  def pretty_print
    puts "Title: " + @title
    puts "Description: " + @description
    puts "Link: " + @link
    puts "Priority: " + @priority
  end
end
