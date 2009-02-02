class Lead < ActiveRecord::Base
  belongs_to :lead_referral_type
  belongs_to :lead_status
  belongs_to :lead_type
  
  attr_accessor :lead_referral_type_name
  attr_accessor :lead_status_name
  attr_accessor :lead_type_name
  
  before_save :create_lead_referral_type_from_name
  before_save :create_lead_status_from_name
  before_save :create_lead_type_from_name
  
  def create_lead_referral_type_from_name
    lead_referral_type = LeadReferralType.find_by_name(lead_referral_type_name)
    if lead_referral_type.nil?
      unless lead_referral_type_name.blank?
        new_lead_referral_type = LeadReferralType.create(:name => lead_referral_type_name)
        self.lead_referral_type_id = new_lead_referral_type.id
      end
    else
      self.lead_referral_type_id = lead_referral_type.id
    end
  end
  
  def create_lead_status_from_name
    lead_status = LeadStatus.find_by_name(lead_status_name)
    if lead_status.nil?
      unless lead_status_name.blank?
        new_lead_status = LeadStatus.create(:name => lead_status_name)
        self.lead_status_id = new_lead_status.id
      end
    else
      self.lead_status_id = lead_status.id
    end
  end
  
  def create_lead_type_from_name
    lead_type = LeadType.find_by_name(lead_type_name)
    if lead_type.nil?
      unless lead_type_name.blank?
        new_lead_type = LeadType.create(:name => lead_type_name)
        self.lead_type_id = new_lead_type.id
      end
    else
      self.lead_type_id = lead_type.id
    end
  end
  
  def email_with_name
    "#{self.name} <#{self.email}>"
  end
  
end
