class AddPriceToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :price, :decimal
  end

  def self.down
    remove_column :albums, :price
  end
end
