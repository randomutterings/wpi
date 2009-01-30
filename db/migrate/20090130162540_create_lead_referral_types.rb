class CreateLeadReferralTypes < ActiveRecord::Migration
  def self.up
    create_table :lead_referral_types do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :lead_referral_types
  end
end
