class RenameArtistidToArtistId < ActiveRecord::Migration
  def self.up
    rename_column :albums, :artistid, :artist_id
  end

  def self.down
    rename_column :albums, :artist_id, :artistid
  end
end
