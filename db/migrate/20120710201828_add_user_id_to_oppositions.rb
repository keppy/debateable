class AddUserIdToOppositions < ActiveRecord::Migration
  def change
    add_column :oppositions, :user_id, :integer
  end
end
