class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.string :title
      t.string :slide
      t.string :footnotes
      t.string :response
      t.integer :debate_id
      t.integer :user_id

      t.timestamps
    end
  end
end
