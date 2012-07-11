class Opposition < ActiveRecord::Base
  attr_accessible :footnotes, :response, :slide, :title

  belongs_to :user
  belongs_to :debate, :inverse_of => :opposition
end
