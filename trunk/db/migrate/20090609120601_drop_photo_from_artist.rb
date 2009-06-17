class DropPhotoFromArtist < ActiveRecord::Migration
  def self.up
    remove_column :artists, :photo 
  end

  def self.down
    add_column :artists, :photo, :string
  end
end
