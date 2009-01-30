class AddPhotoToAgent < ActiveRecord::Migration
  def self.up
    add_column :agents, :photo_file_name, :string
    add_column :agents, :photo_content_type, :string
    add_column :agents, :photo_file_size, :string
  end

  def self.down
    remove_column :agents, :photo_file_size
    remove_column :agents, :photo_content_type
    remove_column :agents, :photo_file_name
  end
end
