class CreateLabels < ActiveRecord::Migration
  def self.up
    create_table :labels do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :addres
      t.integer :viewed
      t.text :profile
      t.string :logo
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :labels
  end
end
