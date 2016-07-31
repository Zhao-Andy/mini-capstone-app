class RenameImageFromImages < ActiveRecord::Migration
  def change
    rename_column :images, :image, :link
  end
end
