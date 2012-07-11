class AddDebateIdToOppositions < ActiveRecord::Migration
  def create
    add_column :oppositions, :debate_id, :integer
  end
end
