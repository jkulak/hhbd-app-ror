class RenameTitleToName < ActiveRecord::Migration
  def self.up
    rename_column :albums, :title, :name
  end

  def self.down
    rename_column :albums, :name, :title
  end
end
