class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :phone
      t.string :fax
      t.string :tollfree
      t.string :email
      t.text :description
      t.string :permalink
      t.string :idx_url
      t.boolean :active
      t.timestamps
    end
  end
  
  def self.down
    drop_table :agents
  end
end
