require 'spec_helper'

describe "AthenticationPages" do

  subject { page }

    describe "signin page" do
      before { visit sigin_path }

      it { should have_selector('h1',    text: 'Sign in') }
      it { should have_selector('title', text: 'Sign in') }
    end
end
