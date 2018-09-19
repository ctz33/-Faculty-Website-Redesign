# Author: Gail Chen
# Created: 6/25
# Edit: N/A
# Description: Test the awards page.
# Test plan: Checks the webpage has the following elements:
# 1. A header
# 2. Two subheaders
# 3. A sidebar with links to different sections of the awards page
# 4. 45 awards

require_relative '../spec_helper'

describe 'awards', :type => :feature do
  before do
    visit '/awards.html'
  end

  it 'has the correct header' do
    expect(page).to have_selector('h1' , :text => 'Awards and Accomplishments')
  end

  it 'has the correct subheaders' do
    within 'div[id="favorite_awards"]' do
      expect(page).to have_selector('h2' , :text => 'Favorite Award')
    end
    within 'div[id="other_awards"]' do
      expect(page).to have_selector('h2' , :text => 'Other Awards')
    end
  end

  it 'has the correct sidebar' do
    expect(page).to have_selector '#awards_sidebar'
    within '#awards_sidebar' do
      expect(page).to have_link "Favorite", :href=>"#favorite_awards_nav"
      expect(page).to have_link "Other", :href=>"#other_awards_nav"
    end
  end

  it 'has the correct contents' do
    within 'div.content-container' do
      expect(page).to have_selector 'h4', :count => 45
      expect(page).to have_selector 'p', :count => 45
    end
  end

end
