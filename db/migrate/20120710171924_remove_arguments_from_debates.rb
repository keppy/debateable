class RemoveArgumentsFromDebates < ActiveRecord::Migration
  def up
    remove_column :debates, :proposition_id
        remove_column :debates, :opposition_id
      end

  def down
    add_column :debates, :opposition_id, :integer
    add_column :debates, :proposition_id, :integer
  end
end
