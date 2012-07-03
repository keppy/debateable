class Debate < ActiveRecord::Base
  attr_accessible :opposition_id, :proposition_id, :title

  validates :proposition_user_id, presence: true
  validates :proposition_id,      presence: true
  validates :title,               presence: true

  has_many :users
  has_one :proposition
  has_one :opposition

end
