class AddFeaturedColumnToPick < ActiveRecord::Migration
  def change
    add_column :picks, :featured, :boolean
  end
end
