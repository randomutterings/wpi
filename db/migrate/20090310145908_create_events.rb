class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.boolean :display
      t.integer :listing_id
      t.date :day
      t.time :start
      t.time :end
      t.timestamps
    end
  end
  
  def self.down
    drop_table :events
  end
end
