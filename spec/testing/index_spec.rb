# Author: Ariel Zhu
# Created: 6/25
# Edit: 6/25 Gail add test plan, checks image link
# Description: Test the home page.
# Test plan: Checks the webpage has the following elements:
# 1. A header
# 2. Two subheaders
# 3. An image

require_relative '../spec_helper'

describe 'index', :type => :feature do
  before do
    visit '/'
  end

  it 'has the correct header' do
    expect(page).to have_selector 'h1'
    within 'h1' do
      expect(page).to have_content("Christopher Stewart")
    end
  end

  it 'has the correct subheader' do
    expect(page).to have_selector 'h3.sketch'
    within 'h3.sketch' do
      expect(page).to have_content("Brief Biographical Sketch")
    end
    expect(page).to have_selector 'h3.highlights'
    within 'h3.highlights' do
      expect(page).to have_content("Highlights")
    end
  end

  it 'has a image' do
    expect(page).to have_selector 'img[src="images/cstewart.2018.jpg"]'
  end

end
