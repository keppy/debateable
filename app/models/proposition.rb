class Proposition < ActiveRecord::Base
  attr_accessible :footnotes, :response, :slide, :title

  belongs_to :user
  has_one :opposition
  validates :user_id, presence: true
  validates :title, presence: true

  # This method creates a debate and
  # Assigns its id to the instance's 
  # debate_id
  def index_on_debate
    @debate = self.build_debate(title: self.title)
  end
end
