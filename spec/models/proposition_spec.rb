require 'spec_helper'

describe Proposition do

  let(:user) { FactoryGirl.create(:user) }
  before { @proposition = user.propositions.build(title: "Thbt testing") }

  subject { @proposition }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when title is nil" do
    before { @proposition.title = nil }
    it { should_not be_valid }
  end

  describe "when user_id is nil" do
    before { @proposition.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Proposition.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
