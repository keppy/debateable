require 'spec_helper'

describe Debate do

  before do
    @debate = Debate.new(title: "Test Debate")
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
end
