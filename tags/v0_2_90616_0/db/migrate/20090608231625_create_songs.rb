class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name
      t.integer :length
      t.integer :added_by
      t.integer :updated_by
      t.text :description
      t.integer :viewed

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
