class Opposition < ActiveRecord::Base
  attr_accessible :footnotes, :response, :slide, :title

  belongs_to :user, :inverse_of => :oppositions
end
