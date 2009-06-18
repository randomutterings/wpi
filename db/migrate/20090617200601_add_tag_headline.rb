class AddTagHeadline < ActiveRecord::Migration
  def self.up
    add_column :agents, :tag_headline, :string
  end

  def self.down
    remove_column :agents, :tag_headline
  end
end
