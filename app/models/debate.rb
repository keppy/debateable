class Debate < ActiveRecord::Base
  attr_accessible :title, :proposition_attributes, :opposition_attributes

  validates :proposition_user_id, presence: true
  validates :title,               presence: true

  belongs_to :proposition_user, :class_name => "User", :foreign_key => "proposition_user_id"
  belongs_to :opposition_user, :class_name => "User", :foreign_key => "opposition_user_id"
  has_one :proposition, :inverse_of => :debate
  has_one :opposition, :inverse_of => :debate

  accepts_nested_attributes_for :proposition, :opposition

end
