require 'minitest/autorun'
require 'minitest/pride'

describe "Proposition integration" do
  it "shows proposition's title" do
    Fabricate(:proposition)
    visit proposition_path(proposition)
    page.text.must_include "THBT testing rocks"
  end
end
