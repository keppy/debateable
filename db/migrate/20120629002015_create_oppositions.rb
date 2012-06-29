class CreateOppositions < ActiveRecord::Migration
  def change
    create_table :oppositions do |t|
      t.string :title
      t.integer :debateable_id
      t.string :debateable_type
      t.string :slide
      t.string :footnotes
      t.string :response

      t.timestamps
    end
  end
end
