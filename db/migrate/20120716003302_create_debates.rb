class CreateDebates < ActiveRecord::Migration
  def change
    create_table |t|
      t.string :title
      t.integer :proposition_user_id
      t.integer :opposition_user_id

      t.timestamps
    end
  end
end
