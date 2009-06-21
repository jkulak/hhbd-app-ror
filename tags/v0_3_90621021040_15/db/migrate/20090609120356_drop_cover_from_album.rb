class DropCoverFromAlbum < ActiveRecord::Migration
  def self.up
    remove_column :albums, :cover 
  end

  def self.down
    add_column :albums, :cover, :string
  end
end
