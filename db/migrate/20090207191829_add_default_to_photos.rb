class AddDefaultToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :primary, :boolean
  end

  def self.down
    remove_column :photos, :primary
  end
end
