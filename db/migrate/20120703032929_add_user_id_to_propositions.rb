class AddUserIdToPropositions < ActiveRecord::Migration
  def change
    add_column :propositions, :user_id, :integer
  end
end
