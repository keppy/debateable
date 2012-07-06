require 'spec_helper'

describe Debate do

  #let(:prop_user) { FactoryGirl.create(:user) }
  #let(:opp_user) { FactoryGirl.create(:user) }
  before do
    @prop_user = User.new(name: "Prop User", email: "prop@email.com")
    @opp_user = User.new(name: "Opp User", email: "opp@email.com") 
    @debate = Debate.new(title: "Test Debate")
    @prop_argument = @prop_user.propositions.build(title: "Prop Title")
    @opp_argument = @opp_user.oppositions.build(title: "Opp Title")
  end
  subject { @debate }

  it { should respond_to(:title) }
  it { should respond_to(:proposition_id) }
  it { should respond_to(:opposition_id) }

  describe "when the debate has no title" do
    before { @debate.title = " " }
    it { should_not be_valid }
  end

  describe "when the debate has no prop id" do
    before { @debate.proposition_id = nil }
    it { should_not be_valid }
  end

  describe "when the debate has no opp id" do
    before { @debate.opposition_id = nil }
    it { should_not be_valid }
  end

# Accessible Attributes Safety
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Debate.new(user_id: @prop_user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to proposition_id" do
      expect do
        Debate.new(proposition_id: @prop_argument.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to opposition_id" do
      expect do
        Debate.new(opposition_id: @opp_argument.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
