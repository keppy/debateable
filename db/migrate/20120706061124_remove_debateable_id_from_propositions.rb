class RemoveDebateableIdFromPropositions < ActiveRecord::Migration
  def up
    remove_column :propositions, :debateable_id
    remove_column :propositions, :debateable_type
    remove_column :propositions, :debate_id
  end

  def down
    add_column :propositions, :debateable_id, :integer
    add_column :propositions, :debateable_type, :string
    add_column :propositions, :debate_id, :integer
  end
end
