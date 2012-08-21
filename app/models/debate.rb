class Debate < ActiveRecord::Base
  attr_accessible :title, :proposition_attributes, :opposition_attributes

end
