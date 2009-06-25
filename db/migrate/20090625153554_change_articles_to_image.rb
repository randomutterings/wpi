class ChangeArticlesToImage < ActiveRecord::Migration
  def self.up
    remove_column :articles, :background_image
  end

  def self.down
    add_column :articles, :background_image, :string
  end
end
