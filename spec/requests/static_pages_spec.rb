require 'spec_helper'

describe "Static pages" do

  subject {page}  
  
  describe "Home page" do
    before { visit root_path }
    
      it { should have_selector('h1',    text: 'Welcome to Debateable,') }
      it { should have_selector('title', text: full_title('')) }
      it { should_not have_selector 'title', text: '| Home' }  
  end
   
  describe "About page" do
    before { visit about_path }

      it { should have_selector('h1', text: 'About debateable') }
      it { should have_selector('title', text: full_title('About')) }
  end  

  describe "Help page" do
    before { visit help_path }

      it { should have_selector('h1', text: 'Help') }
      it { should have_selector('title', text: full_title('Help')) }
  end
end
