class RemoveUserIdFromDebates < ActiveRecord::Migration
  def up
    remove_column :debates, :user_id
      end

  def down
    add_column :debates, :user_id, :integer
  end
end
