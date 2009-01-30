class CreateLeads < ActiveRecord::Migration
  def self.up
    create_table :leads do |t|
      t.integer :lead_type_id
      t.string :name
      t.string :spouse_name
      t.string :email
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :age
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.text :comments
      t.integer :lead_referral_type_id
      t.integer :lead_status_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :leads
  end
end
