class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :account_id
      t.integer :document_id

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
