class AddProfitLossToPick < ActiveRecord::Migration
  def change
    add_column :picks, :profit, :decimal
    add_column :picks, :loss, :decimal
  end
end
