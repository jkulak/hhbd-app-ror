class RenameAddedByToCreatedByInSongs < ActiveRecord::Migration
  def self.up
    rename_column :songs, :added_by, :created_by
  end

  def self.down
    rename_column :songs, :created_by, :added_by
  end
end
