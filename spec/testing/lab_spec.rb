# Author: Ariel Zhu
# Created: 6/25
# Edit: 6/25 Gail add test plan
# Test plan:
# 1. Check correct header
  # a. has header
  # b. header has correct content
# 2. Check all the images are correct
# 3. Check the first part of page (guild list) is Correct
      # a. has guild list
      # b. list has correct number of elements
      # c. list elements has correct content
# 4. Check the second part of page (people table) is Correct
      # a. has people table
      # a. people table has correct number of elements
      # b. people table elements has correct content
          #i. PHD students info is correct
          #ii. master students info is correct
          #iii. undergraduate students info is correct
          #v. intern students info is correct
# 5. Check the third part of page (project table) is Correct
      # a. has project table
      # a. project table has correct number of elements
      # b. project table elements has correct content
          #i. project1 info is correct
          #ii. project2 info is correct
          #iii. project3 info is correct

require_relative '../spec_helper'

describe 'lab', :type => :feature do
  before do
    visit '/lab.html'
  end

  it 'has the correct header' do
    expect(page).to have_selector 'h1'
    within '.lab_overview//h1' do
      expect(page).to have_content("ReRout Lab Overview")
    end
  end


  it 'has images' do
    expect(page).to have_selector(:css, 'img[src="images/rerout-sg.jpg"]')
    expect(page).to have_selector(:css, 'img[src="images/mantismail.png"]')
  end

  it 'has the correct guild_list' do
    expect(page).to have_selector '.lab_intro'
    expect(page).to have_selector '.guild_list'
    expect(page).to have_css("ol//li", :count => 3)
    within 'ol' do
      expect(page).to have_content("Motivating and training the next generation of systems builders is paramount")
      expect(page).to have_content("Real, open, and usable systems prototypes have big impact")
      expect(page).to have_content("Well-solved research problems can qualitatively change a user's interaction with their computer")
    end

  end


  it 'has the correct people table' do

    expect(page).to have_selector '.select_list'
    expect(page).to have_css(".select_list > label", :count => 4)
    expect(page).to have_css(".select_list > input", :count => 4)
    expect(page).to have_css(".select_list > p", :count => 4)
    expect(page).to have_css(".select_list > div", :count => 4)

    expect(page).to have_css(".phdStudent .student_name", :count => 6)
    expect(page).to have_css(".masterStudent .student_name", :count => 10)
    expect(page).to have_css(".undergdStudent .student_name", :count => 6)
    expect(page).to have_css(".intern .student_name", :count => 4)
    within '.phdStudent' do
      expect(page).to have_content("Jayson Boubin")
      expect(page).to have_content("Research Highlights: Winner CSE Departmental Fellowship")
      expect(page).to have_selector(:css, 'a[href="https://www.linkedin.com/in/jayson-boubin-94a51a89/"]')
    end
    within '.masterStudent' do
      expect(page).to have_content("Siva Meenakshi Renganathan")
      expect(page).to have_content("2017, Apple")
      expect(page).to have_no_selector(:css, '.masterStudent//a')
    end
    within '.undergdStudent' do
      expect(page).to have_content("Stephanie Mohammed")
      expect(page).to have_content("2016, Exact Software ")
      expect(page).to have_no_selector(:css, 'a')
    end
    within '.intern' do
      expect(page).to have_content("Onix Tarrat")
      expect(page).to have_content("SROP, 2017")
      expect(page).to have_no_selector(:css, 'a')
    end
  end

  it 'has the correct project table' do
    expect(page).to have_selector '.projects'
    expect(page).to have_css(".navtab > label", :count => 3)
    expect(page).to have_css(".navtab > input", :count => 3)
    expect(page).to have_css(".navtab > p", :count => 3)
    expect(page).to have_css(".navtab > div", :count => 3)

    expect(page).to have_selector 'div.project1'
    expect(page).to have_selector 'div.project2'
    expect(page).to have_selector 'div.project3'

    within('.project1') do
      expect(page).to have_selector 'h2'
      within 'h2' do
        expect(page).to have_content("Greening as a Service")
      end
      expect(page).to have_css("h3", :count => 4)
    end

    within('.project2') do
      expect(page).to have_selector 'h2'
      within 'h2' do
        expect(page).to have_content("High Performance Cloud Infrastructure")
      end
      expect(page).to have_css("h3", :count => 4)
    end

    within('.project3') do
      expect(page).to have_selector 'h2'
      within 'h2' do
        expect(page).to have_content("Quality Aware Management")
      end
      expect(page).to have_selector(:css, 'iframe[src="https://www.youtube.com/embed/eiA5Uo1uJHI"]')
      expect(page).to have_css("h3", :count => 3)
    end
  end

end
