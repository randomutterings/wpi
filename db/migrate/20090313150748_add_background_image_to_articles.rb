class AddBackgroundImageToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :background_image, :string
  end

  def self.down
    remove_column :articles, :background_image
  end
end
