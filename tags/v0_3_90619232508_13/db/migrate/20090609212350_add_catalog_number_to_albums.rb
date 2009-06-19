class AddCatalogNumberToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :catalog_number, :string
  end

  def self.down
    remove_column :albums, :catalog_number
  end
end
