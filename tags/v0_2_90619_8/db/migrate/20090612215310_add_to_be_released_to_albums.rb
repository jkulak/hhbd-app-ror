class AddToBeReleasedToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :to_be_released, :string
  end

  def self.down
    remove_column :albums, :to_be_released
  end
end
