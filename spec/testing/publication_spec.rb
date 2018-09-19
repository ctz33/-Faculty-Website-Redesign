# Author: Ariel Zhu
# Created: 6/25
# Edit: 6/25 Gail add more cases to test sidebar
# Description: Test the publications page.
# Test plan: Checks the webpage has the following elements:
# 1. A header
# 2. A sidebar with links to different sections of the awards page
# 3. A table with correct data

require_relative '../spec_helper'

describe 'publication', :type => :feature do
  before do
    visit '/publication.html'
  end

  it 'has the correct header' do
    expect(page).to have_selector 'h1'
    within 'h1' do
      expect(page).to have_content("Publications")
    end
  end

  it 'has the correct sidebar' do
    expect(page).to have_selector '#publication-year-sidebar'
    within '#publication-year-sidebar' do
      expect(page).to have_link "2018", :href=>"#year-2018"
      expect(page).to have_link "2014", :href=>"#year-2014"
      expect(page).to have_link "2010", :href=>"#year-2010"
      expect(page).to have_link "2004", :href=>"#year-2004"
    end
  end

  it 'has the correct table' do
    expect(page).to have_css("table", :count => 15)
    expect(page).to have_css("tr", :count => 79)
    expect(page).to have_css("a.pdf", :count => 58)
    expect(page).to have_css("a.ppt", :count => 40)
    expect(page).to have_css("a.bib", :count => 64)
    expect(page).to have_css("a.event", :count => 60)
    page.all('table').each do |table|
      expect(page).to have_selector 'td.title'
      expect(page).to have_selector 'td.author'
      expect(page).to have_selector 'td.event'
      expect(page).to have_selector 'td.location'
      expect(page).to have_selector 'a.pdf'
      expect(page).to have_selector 'a.ppt'
      expect(page).to have_selector 'a.bib'
      expect(page).to have_selector 'a.event'
    end
    expect(page).to have_content("Model-driven Computational Sprinting")
    expect(page).to have_content("Nathaniel Morris, Christopher Stewart, Lydia Chen, Robert Birke, Jaimie Kelley")
    expect(page).to have_content("ACM European Conference on Computer Systems")
    expect(page).to have_content("Porto, Portugal")
    expect(page).to have_selector(:css, 'a.pdf[href="http://www.cse.ohio-state.edu/~cstewart/Papers/morris2018modeldriven.pdf"]')
    expect(page).to have_selector(:css, 'a.ppt[href="http://www.cse.ohio-state.edu/~cstewart/Papers/morris2018modeldriven-slides.pdf"]')
    expect(page).to have_selector(:css, 'a.bib[href="http://web.cse.ohio-state.edu/~stewart.962/bibtex/morris2018modeldriven"]')
    expect(page).to have_no_selector(:css, 'a.event[href="http://www.cse.ohio-state.edu/~cstewart/Papers/morris2018modeldriven.pdf"]')
    end

end
