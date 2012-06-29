class Debate < ActiveRecord::Base
  attr_accessible :opposition_id, :proposition_id, :title

  validates :opposition_id,  presence: true
  validates :proposition_id, presence: true
  validates :title,          presence: true

  has_one :proposition, :as => :debateable
  has_one :opposition, :as => :debateable

end
