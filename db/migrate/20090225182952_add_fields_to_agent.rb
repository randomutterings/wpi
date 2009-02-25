class AddFieldsToAgent < ActiveRecord::Migration
  def self.up
    add_column :agents, :tag, :text
    add_column :agents, :mission, :text
  end

  def self.down
    remove_column :agents, :mission
    remove_column :agents, :tag
  end
end
