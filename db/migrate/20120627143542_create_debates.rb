class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :title
      t.integer :proposition_id
      t.integer :opposition_id

      t.timestamps
    end
  end
end
