require 'spec_helper'

describe "Proposition pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "proposition creation" do
    before { visit new_proposition_path(user) }

    describe "with invalid information" do

      it "should not create a proposition" do
        expect { click_button "Save Proposition" }.should_not change(Proposition, :count)
      end
    end

    describe "with valid information" do

      before { fill_in 'proposition_title', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Save Proposition" }.should change(Proposition, :count).by(1)
      end
    end
  end
end
