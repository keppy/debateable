require 'spec_helper'

describe Proposition do

# The user creates a proposition with a title.
# The proposition does not gain a debate_id
# untill the user publishes the proposition
# for debate; when this happens, a new instance
# of debate is created and its id is assinged to
# the proposition as its debate_id. Debate publish
# functionality belongs in the user model?
  let(:user) { FactoryGirl.create(:user) }
  before do
    @prop = user.propositions.build(title: "Thbt testing rocks")
  end

  subject { @prop }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  # Its debate_id should be the 
  # last debate_id in the index
  # (most recently created index)
  # This happens when the proposition is
  # published, made public for response.
  describe "debate index creation" do
    before do 
      @prop.index_on_debate
    end
      
    its(:debate_id) { should_not be_nil }
    its(:debate_id) { should == Debate.last.id }
  end 

  # Testing for nil attributes
  describe "when title is nil" do
    before { @prop.title = nil }
    it { should_not be_valid }
  end

  describe "when user_id is nil" do
    before { @prop.user_id = nil }
    it { should_not be_valid }
  end

# Check to see that a new debate_id is assinged when
# a new proposition is created

end
