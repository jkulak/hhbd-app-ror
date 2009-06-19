class DropLogoFromLabel < ActiveRecord::Migration
  def self.up
    remove_column :labels, :logo 
  end

  def self.down
    add_column :labels, :logo, :string
  end
end
