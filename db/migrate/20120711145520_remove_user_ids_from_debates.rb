class RemoveUserIdsFromDebates < ActiveRecord::Migration
  def up
    remove_column :debates, :proposition_user_id
        remove_column :debates, :opposition_user_id
      end

  def down
    add_column :debates, :opposition_user_id, :integer
    add_column :debates, :proposition_user_id, :integer
  end
end
