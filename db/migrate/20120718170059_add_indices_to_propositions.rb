class AddIndicesToPropositions < ActiveRecord::Migration
  add_index :propositions, [:user_id, :debate_id, :created_at]
end
