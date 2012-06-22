require 'spec_helper'

describe User do

  before { @user = User.new(name: "Test User", email: "user@example.com",
                            password_confirmation: "foobar", password: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when emails is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "b" * 50 }
    it { should_not be_valid }
  end

  describe "when email format isn't legit" do
    it "should be invalid" do
      addresses = %w[e_*@example.com aREF.b.com f.w@f,jp a!1/bull.shit]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format seems legit" do
    it "should be valid" do
      addresses = %w[mes@iaht.com B_EU-RE@g.m.org a+b@who.in]
      addresses.each do |valid_address|
        @user.email = valid_address
	@user.should be_valid
      end
    end
  end

  describe "when the email is associated with another user" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password doesn't match password_confirmation" do
    before { @user.password = "shitbar" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
