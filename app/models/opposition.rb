class Opposition < ActiveRecord::Base
  attr_accessible :debateable_id, :debateable_type, :footnotes, :response, :slide, :title

  belongs_to :debateable, :polymorphic => true

end
