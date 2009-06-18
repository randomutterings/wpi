class RemoveMissionStatement < ActiveRecord::Migration
  def self.up
    remove_column :agents, :mission
  end

  def self.down
    add_column :agents, :mission, :text
  end
end
