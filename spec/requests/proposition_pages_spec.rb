require 'spec_helper'
describe "Proposition pages" do

  subject { page }

  describe "Creation page" do

    let(:user) { FactoryGirl.create(:user) }
    let(:proposition) { FactoryGirl.create(:proposition) }

    before do
      sign_in(user)
      visit new_user_proposition_path(user, @proposition)
    end

    it { should have_selector('h1',    text: 'Proposition') }
    it { should have_selector('title', text: 'Create a Proposition') }
    it { should have_button('Save Proposition') }
      
    describe "creating a proposition" do
      let(:submit) { "Save Proposition" }

      describe "with invalid proposition fields" do
        it "should not change proposition count" do
          expect { click_button submit }.not_to change(Proposition, :count)
        end
      end

      describe "with valid proposition fields" do
        before do
          fill_in "proposition_title",     with: "THBT Testing is the only option."
          fill_in "proposition_slide",     with: "a1s2d3f4g5"
          fill_in "proposition_footnotes", with: "foobar"
        end

        it "should create a proposition" do
          expect { click_button submit }.to change(Proposition, :count).by(1)
        end
        
      end
    end
  end

  describe "Index page" do

    subject { page }

    describe "as an unidentified user" do
      before { visit propositions_path }
      it { should have_selector('div.alert.alert-alert', text: 'You may browse current debates, but you should sign up to start debating!') }
    end

    describe "as authentic user" do

      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in(user)
        visit propositions_path
      end 

      it { should have_selector('title', text: 'Debateable Propositions') }
      it { should have_selector('h1', text: 'Debateable Propositions') }

    end
  end

  describe "Proposition page"

    subject { page }
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
    let(:prop1) { FactoryGirl.create(:proposition, user: user1) }

    describe "as an unidentified user" do
      before { visit proposition_path(prop1) }
      it { should have_selector('div.alert.alert-alert', text: 'Sign Up or Sign In to oppose this proposition.') }
  end
end
