ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"
require "factory_girl"

# Uncomment if you want Capybara in accceptance/integration tests
 require "minitest/rails/capybara"

# Uncomment if you want awesome colorful output
 require "minitest/pride"

  FactoryGirl.definition_file_paths = %w(debateable/spec/factories.rb)
  FactoryGirl.find_definitions

  class MiniTest::Spec
    before :each do
      DatabaseCleaner.clean
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end

class MiniTest::Rails::ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Do you want all existing Rails tests to use MiniTest::Rails?
# Comment out the following and either:
# A) Change the require on the existing tests to `require "minitest_helper"`
# B) Require this file's code in test_helper.rb

# MiniTest::Rails.override_testunit!
