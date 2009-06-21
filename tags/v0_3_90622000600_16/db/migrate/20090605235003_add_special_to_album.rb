class AddSpecialToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :special, :bool
  end

  def self.down
    remove_column :albums, :special
  end
end
