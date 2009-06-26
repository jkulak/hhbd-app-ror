class AddColumnsToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :concert_info, :string
    add_column :artists, :since, :date
    add_column :artists, :till, :date
    add_column :artists, :artist_type, :integer
    add_column :artists, :special, :integer
    add_column :artists, :trivia, :string
    add_column :artists, :created_by, :integer
    add_column :artists, :updated_by, :integer
    add_column :artists, :viewed, :integer
    add_column :artists, :status, :integer
  end

  def self.down
    remove_column :artists, :status
    remove_column :artists, :viewed
    remove_column :artists, :updated_by
    remove_column :artists, :created_by
    remove_column :artists, :trivia
    remove_column :artists, :special
    remove_column :artists, :artist_type
    remove_column :artists, :till
    remove_column :artists, :since
    remove_column :artists, :concert_info
  end
end
