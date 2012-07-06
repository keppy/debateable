class RemoveDebateableIdFromOppositions < ActiveRecord::Migration
  def up
    remove_column :oppositions, :debateable_id
    remove_column :oppositions, :debateable_type
    remove_column :oppositions, :debate_id
  end

  def down
    add_column :oppositions, :debateable_id, :integer
    add_column :oppositions, :debateable_type, :string
    add_column :oppositions, :debate_id, :integer
  end
end
