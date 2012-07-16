require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }

    describe "visiting the proposition creation page" do
      before { visit new_user_proposition_path(user) }
      let(:submit) { "Save Proposition" }

      it { should have_selector('title', text: 'Create a Proposition') }
      it { should have_selector('h1',    text: 'Proposition') }

      describe "with invalid proposition fields" do
        it "should not change proposition count" do
          expect { click_button submit }.not_to change(Proposition, :count)
        end
      end

      describe "with valid proposition fields" do
        before do
        fill_in "Topic",     with: "THBT Testing is the only option."
        fill_in "Slide",     with: "a1s2d3f4g5"
        fill_in "Footnotes", with: "foobar"
        end
      end

      it "should create a proposition" do
        expect { click_button submit }.to change(Proposition, :count).by(1)
      end

      describe "after saving the proposition" do
        before { click_button submit }
        let(:proposition) { Proposition.find_by_slide('a1s2d3f4g5') }

        it { should have_selector('title', text: proposition.title) }
        it { should have_selector('h1', text: proposition.title) }
        it { should have_selector('div.alert.alert-success', text: 'Proposition Created.') }
        it { should have_link('Propose another topic for debate') }
        it { should have_link('Make this topic Debateable!') }
      end
    end
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create User" }

    describe "with invalid credentials or information" do
      it "should not change user count" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid credentials and information" do
      before do
        fill_in "Name",         with: "Test User"
        fill_in "Email",        with: "user@test.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@test.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome, debater!') }
        it { should have_link('Sign out') }
      end
    end
  end 
end
