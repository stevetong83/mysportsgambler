class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.string :game
      t.string :line
      t.string :pick
      t.text :analysis

      t.timestamps
    end
  end
end
