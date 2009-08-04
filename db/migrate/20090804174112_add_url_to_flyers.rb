class AddUrlToFlyers < ActiveRecord::Migration
  def self.up
    add_column :flyers, :url, :string
  end

  def self.down
    remove_column :flyers, :url
  end
end
