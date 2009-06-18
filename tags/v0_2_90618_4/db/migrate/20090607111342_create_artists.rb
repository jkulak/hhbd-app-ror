class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :name
      t.string :realname
      t.string :website
      t.string :photo

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
