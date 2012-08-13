class AddCategoryIdToPick < ActiveRecord::Migration
  def change
    add_column :picks, :category_id, :integer
  end
end
