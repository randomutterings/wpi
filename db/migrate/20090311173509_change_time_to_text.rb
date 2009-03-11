class ChangeTimeToText < ActiveRecord::Migration
  def self.up
    remove_column :events, :start
    remove_column :events, :end
    add_column :events, :time, :string
  end

  def self.down
    remove_column :events, :time
    add_column :events, :start, :time
    add_column :events, :end, :time
  end
end
