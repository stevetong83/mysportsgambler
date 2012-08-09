class AddColumnToPick < ActiveRecord::Migration
  def change
    add_column :picks, :game_day, :datetime
  end
end
