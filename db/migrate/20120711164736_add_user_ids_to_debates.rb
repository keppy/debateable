class AddUserIdsToDebates < ActiveRecord::Migration
  def down
    remove_column :debates, :proposition_user_id
        remove_column :debates, :opposition_user_id
      end

  def up
    add_column :debates, :opposition_user_id, :integer
    add_column :debates, :proposition_user_id, :integer
  end
end
