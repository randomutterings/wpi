class CreateLeadStatuses < ActiveRecord::Migration
  def self.up
    create_table :lead_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :lead_statuses
  end
end
