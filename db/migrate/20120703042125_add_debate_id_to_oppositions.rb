class AddDebateIdToOppositions < ActiveRecord::Migration
  def change
    add_column :oppositions, :debate_id, :integer
  end
end
