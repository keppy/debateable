class AddDebateIdToPropositions < ActiveRecord::Migration
  def change
    add_column :propositions, :debate_id, :integer
  end
end
