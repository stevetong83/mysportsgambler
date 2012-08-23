class AddImageUrlColumnToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :image_url, :string
  end
end
