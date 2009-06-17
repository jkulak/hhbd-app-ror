class RenameProfileToDescription < ActiveRecord::Migration
  def self.up
    rename_column :labels, :profile, :description
  end

  def self.down
        rename_column :labels, :description, :profile
  end
end
