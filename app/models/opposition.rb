class Opposition < ActiveRecord::Base
  attr_accessible :footnotes, :response, :slide, :title

<<<<<<< HEAD
  belongs_to :user, :inverse_of => :oppositions
=======
  belongs_to :debate
>>>>>>> e0a5ffe67c1b2224edab6041c32406f187b8191d
end
