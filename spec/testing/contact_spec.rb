# Author: Gail Chen
# Created: 6/25
# Edit: N/A
# Description: Test the contact page.
# Test plan: Checks if the webpage has the following elements:
# 1. Two headers
# 2. Contact information list
# 3. Map
# 4. Images
# 5. Links

require_relative '../spec_helper'

describe 'contact', :type => :feature do
  before do
    visit '/contact.html'
  end

  it 'has the correct headers' do
    expect(page).to have_selector('h1.info' , :text => 'Contact Information')
    expect(page).to have_selector('h1.photo' , :text => 'Press Photos')
  end

  it 'has a list' do
    expect(page).to have_selector 'ul.info'
    within 'ul.info' do
      expect(page).to have_selector "li", :count => 4
      expect(page).to have_selector "li", :text => "Email: cstewart@cse.ohio-state.edu"
      expect(page).to have_selector "li", :text => "Office: RM 793"
      expect(page).to have_selector "li", :text => "Office phone: (614) 292-7325"
      expect(page).to have_selector "li", :text => "Department of Computer Science and Engineering The Ohio State University 395 Dreese Lab"
    end
  end

  it 'has a inline frame for map' do
    expect(page).to have_selector 'iframe'
  end

  it 'has images' do
    within '#photos' do
      expect(page).to have_selector 'img', :count => 12
      expect(page).to have_selector 'label', :count => 6
      expect(page).to have_selector 'input[type="radio"]', :count => 6
    end
    expect(page).to have_selector 'input[id="id1"][checked]'
    expect(page).to have_no_selector 'input[id="id2"][checked]'
    expect(page).to have_no_selector 'input[id="id3"][checked]'
    expect(page).to have_no_selector 'input[id="id4"][checked]'
    expect(page).to have_no_selector 'input[id="id5"][checked]'
    expect(page).to have_no_selector 'input[id="id6"][checked]'
  end

  it 'has links' do
    within '#info-links' do
      expect(page).to have_selector 'a', :count => 4
      expect(page).to have_link "Google+", :href=>"https://plus.google.com/u/0/+ChristopherStewartPhD"
      expect(page).to have_link "Google Scholar", :href=>"https://scholar.google.com/citations?user=iYgWtREAAAAJ&hl=en"
      expect(page).to have_link "Facebook", :href=>"https://www.facebook.com/christopher.charles.stewart"
      expect(page).to have_link "Curriculum Vitae (out of date)", :href =>"../data/cstewart.cv.pdf"
    end
  end

end
