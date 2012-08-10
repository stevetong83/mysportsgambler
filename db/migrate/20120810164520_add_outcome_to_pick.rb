class AddOutcomeToPick < ActiveRecord::Migration
  def change
    add_column :picks, :outcome, :string
  end
end
