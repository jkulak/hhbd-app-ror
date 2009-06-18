class AddColumnsToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :acapella, :boolean
    add_column :songs, :radio_edit, :boolean
    add_column :songs, :instrumental, :boolean
    add_column :songs, :status, :integer
  end

  def self.down
    remove_column :songs, :status
    remove_column :songs, :instrumental
    remove_column :songs, :radio_edit
    remove_column :songs, :acapella
  end
end
