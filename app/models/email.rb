class Email < ActiveRecord::Base
  validates_presence_of :from, :to, :body, :subject
  attr_accessor :from_name,
                :from_email_address,
                :to_name,
                :to_email_address,
                :your_phone_number,
                :best_time_to_call,
                :email_type,
                :files
  before_validation :prepare_attributes
  before_save :send_email
  
  def prepare_attributes
    if self.email_type == "report"
      self.subject = "FREE Buyer and seller report"
      self.body = "Hello #{self.from_name}, We have received your Free Buyers & Sellers e-Book Request. You can view them by opening the attached PDF files."
      self.files = ["/public/reports/BuyerFreeReport.pdf", "/public/reports/SellersFreeReport.pdf"]
    end
    self.from = "#{self.from_name} <#{self.from_email_address}>" if self.from.blank?
    self.to = "#{self.to_name} <#{self.to_email_address}>" if self.to.blank?
    self.body << "  You can reach me at #{self.your_phone_number}." unless self.your_phone_number.blank?
    self.body << "  The best time to call is #{self.best_time_to_call}." unless self.best_time_to_call.blank?
  end
  
  def send_email
    Notifier.deliver_lead_email(self.from, self.to, self.subject, self.body, self.files)
  end
end
