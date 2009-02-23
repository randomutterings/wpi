class Email < ActiveRecord::Base
  validates_presence_of :from, :to, :body, :subject
  attr_accessor :from_name,
                :from_email_address,
                :to_name,
                :to_email_address,
                :your_phone_number,
                :best_time_to_call,
                :email_type
  before_validation :prepare_attributes
  before_save :send_email
  
  def prepare_attributes
    self.from = "#{self.from_name} <#{self.from_email_address}>" if self.from.nil?
    self.to = "#{self.to_name} <#{self.to_email_address}>" if self.to.nil?
    self.body << "  You can reach me at #{self.your_phone_number}." unless self.your_phone_number.nil?
    self.body << "  The best time to call is #{self.best_time_to_call}." unless self.best_time_to_call.nil?
  end
  
  def send_email
    Notifier.deliver_lead_email(self.from, self.to, self.subject, self.body)
  end
end
