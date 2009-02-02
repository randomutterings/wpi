class AddFromToEmails < ActiveRecord::Migration
  def self.up
    add_column :emails, :from, :string
  end

  def self.down
    remove_column :emails, :from
  end
end
