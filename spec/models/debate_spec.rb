require 'spec_helper'

describe Debate do

  let(:prop_user) { FactoryGirl.create(:user) }
  let(:opp_user) { FactoryGirl.create(:user) }
  before do 
    @gov_debate = prop_user.government_debates.build(title: "THBT testing rules")
    @opp_debate = opp_user.opposition_debates.build(title: "THBT testing sucks")
  end

  subject { @gov_debate }

  it { should respond_to(:title) }
  it { should respond_to(:proposition_user_id) }

  describe "when the debate has no title" do
    before { @gov_debate.title = " " }
    it { should_not be_valid }
  end

  describe "when the debate has no prop id" do
    before { @gov_debate.proposition_user_id = nil }
    it { should_not be_valid }
  end

# Accessible Attributes Safety
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Debate.new(user_id: prop_user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to proposition_user_id" do
      expect do
        Debate.new(proposition_user_id: opp_user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end

#    it "should not allow access to proposition_id" do
#      expect do
#        Debate.new(proposition_id: @prop_argument.id)
#      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
#    end
#
#    it "should not allow access to opposition_id" do
#      expect do
#        Debate.new(opposition_id: @opp_argument.id)
#      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
#    end
#  end
