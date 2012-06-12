require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do

    it "should have the content 'Debateable'" do
      visit '/static_pages/home'
      page.should have_content('Debateable')
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/about'
      page.should have_content('Help')
    end
  end
end
