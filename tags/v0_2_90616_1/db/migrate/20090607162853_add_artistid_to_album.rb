class AddArtistidToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :artistid, :integer
  end

  def self.down
    remove_column :albums, :artistid
  end
end
