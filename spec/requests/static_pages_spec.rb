require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do

    it "should have the content 'Debateable'" do
      visit '/static_pages/home'
      page.should have_content('Debateable')
    end
   
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                                :text => "Debateable")

    end
 
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')

    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end

    it "should have the correct title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                                :text => "Debateable | About")
    end  

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have the correct title" do
      visit '/static_pages/help'
      page.should have_selector('title',
                                :text => "Debateable | Help")
    end
  end
end
