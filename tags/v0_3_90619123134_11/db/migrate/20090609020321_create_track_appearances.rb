class CreateTrackAppearances < ActiveRecord::Migration
  def self.up
    create_table :track_appearances do |t|
      t.integer :album_id
      t.integer :song_id
      t.integer :as_number

      t.timestamps
    end
  end

  def self.down
    drop_table :track_appearances
  end
end
