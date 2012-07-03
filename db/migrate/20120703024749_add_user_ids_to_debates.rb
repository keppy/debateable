class AddUserIdsToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :proposition_user_id, :integer
    add_column :debates, :opposition_user_id, :integer
  end
end
