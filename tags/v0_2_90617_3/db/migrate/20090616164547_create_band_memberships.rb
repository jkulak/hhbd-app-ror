class CreateBandMemberships < ActiveRecord::Migration
  def self.up
    create_table :band_memberships do |t|
      t.integer :artist_id
      t.integer :band_id
      t.date :joined
      t.date :left
      t.integer :created_by
      t.integer :updated_by
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :band_memberships
  end
end
