class AddCoverurlToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :cover, :string
  end

  def self.down
    remove_column :albums, :cover
  end
end
