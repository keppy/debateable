class Debate < ActiveRecord::Base
  attr_accessible :opposition, :proposition, :user, :title

  validates :proposition_user_id, presence: true
  validates :proposition_id,      presence: true
  validates :title,               presence: true

  belongs_to :proposition_user, :class_name => "User", :foreign_key => "proposition_user_id",
             :inverse_of => :debates
  belongs_to :opposition_user, :class_name => "User", :foreign_key => "opposition_user_id", 
             :inverse_of => :debates
  has_one :proposition
  has_one :opposition

end
