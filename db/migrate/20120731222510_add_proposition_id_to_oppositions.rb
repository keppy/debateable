class AddPropositionIdToOppositions < ActiveRecord::Migration
  def change
    add_column :oppositions, :proposition_id, :integer
  end
end
