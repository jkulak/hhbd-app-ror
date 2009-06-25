class AddMediaToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :media, :integer
  end

  def self.down
    remove_column :albums, :media
  end
end
