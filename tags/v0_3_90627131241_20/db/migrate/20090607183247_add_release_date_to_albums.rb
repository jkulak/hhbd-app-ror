class AddReleaseDateToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :release_date, :date
  end

  def self.down
    remove_column :albums, :release_date
  end
end
