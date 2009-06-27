class AddViewedToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :viewed, :integer
  end

  def self.down
    remove_column :albums, :viewed
  end
end
