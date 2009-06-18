class AddImageInfoToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :image_source, :string
    add_column :artists, :image_source_url, :string
  end

  def self.down
    remove_column :artists, :image_source_url
    remove_column :artists, :image_source
  end
end
