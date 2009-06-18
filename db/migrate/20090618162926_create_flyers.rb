class CreateFlyers < ActiveRecord::Migration
  def self.up
    create_table :flyers do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.timestamps
    end
  end
  
  def self.down
    drop_table :flyers
  end
end
