class RemoveArtistTypeFromArtists < ActiveRecord::Migration
  def self.up
    remove_column :artists, :artist_type 
  end

  def self.down
    add_column :artists, :artist_type, :integer 
  end

end