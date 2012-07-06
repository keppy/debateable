class AddUserIdToDebates < ActiveRecord::Migration
  def change
    add_column  :debates, :user_id, :integer
  end
end
