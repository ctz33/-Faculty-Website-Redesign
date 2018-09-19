# Author: Gail Chen
# Created: 6/25
# Edit: N/A
# Description: Test navigation bar.
# Test plan:
# 1. Check the naviagtion bar has links to the other pages
# 2. Check the dropdown menu has links to different sections on the lab page

require_relative '../spec_helper'

# Test Navigation bar on the home page
describe 'index', :type => :feature do
  before do
    visit '/'
  end

  it 'has a navigation bar' do
    expect(page).to have_selector 'div.navbar'
    within 'div.navbar' do
      expect(page).to have_selector 'nav'
      expect(page).to have_selector 'a', :count => 7
      expect(page).to have_link 'Home', :href=>'index.html'
      expect(page).to have_link 'Publications', :href=>'publication.html'
      expect(page).to have_link 'Awards', :href=>'awards.html'
      expect(page).to have_link 'Contact', :href=>'contact.html'
      expect(page).to have_selector 'div.dropdown-content'
    end
  end

  it 'has a dropdown menu' do
    expect(page).to have_selector 'div.dropdown-content'
    within 'div.dropdown-content' do
      expect(page).to have_selector 'a', :count => 3
      expect(page).to have_link 'Lab', :href=>'lab.html'
      expect(page).to have_link 'People', :href=>'lab.html#people_nav'
      expect(page).to have_link 'Projects', :href=>'lab.html#project_nav'
    end
  end
end

# Test Navigation bar on the lab page
describe 'lab', :type => :feature do
  before do
    visit '/lab.html'
  end

  it 'has a navigation bar' do
    expect(page).to have_selector 'div.navbar'
    within 'div.navbar' do
      expect(page).to have_selector 'nav'
      expect(page).to have_selector 'a', :count => 7
      expect(page).to have_link 'Home', :href=>'index.html'
      expect(page).to have_link 'Publications', :href=>'publication.html'
      expect(page).to have_link 'Awards', :href=>'awards.html'
      expect(page).to have_link 'Contact', :href=>'contact.html'
      expect(page).to have_selector 'div.dropdown-content'
    end
  end

  it 'has a dropdown menu' do
    expect(page).to have_selector 'div.dropdown-content'
    within 'div.dropdown-content' do
      expect(page).to have_selector 'a', :count => 3
      expect(page).to have_link 'Lab', :href=>'lab.html'
      expect(page).to have_link 'People', :href=>'lab.html#people_nav'
      expect(page).to have_link 'Projects', :href=>'lab.html#project_nav'
    end
  end
end
