class ChangeAsTrackOnTrackAppearance < ActiveRecord::Migration
  def self.up
    change_column :track_appearances, :as_number, :string 
  end

  def self.down
    change_column :track_appearances, :as_number, :integer 
  end
end
