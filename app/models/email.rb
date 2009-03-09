class Email < ActiveRecord::Base
  validates_presence_of :from, :to, :body, :subject
  attr_accessor :from_name,
                :from_email_address,
                :to_name,
                :to_email_address,
                :your_phone_number,
                :best_time_to_call,
                :email_type,
                :files,
                :address,
                :city,
                :state,
                :zip,
                :resident_status,
                :resident_relationship,
                :property_type,
                :condition,
                :lot_size,
                :square_footage,
                :basement,
                :style,
                :year_built,
                :fireplace,
                :moving,
                :bedrooms,
                :bathrooms,
                :parking,
                :parking_spaces,
                :listing_status,
                :planning,
                :heat_type,
                :ac_type,
                :neighborhood,
                :pool,
                :comments
  before_validation :prepare_attributes
  before_save :send_email
  
  def prepare_attributes
    if self.email_type == "report"
      self.subject = "FREE Buyer and seller report"
      self.body = "Hello #{self.from_name}, We have received your Free Buyers & Sellers e-Book Request. You can view them by opening the attached PDF files."
      self.files = ["/public/reports/BuyerFreeReport.pdf", "/public/reports/SellersFreeReport.pdf"]
    elsif self.email_type == "home_worth"
      self.subject = "Requesting Home Worth"
      self.body = "#{self.from_name} wants to know the value of their home.  Below is the information they provided.\\n"
      self.body << "Address: #{self.address}\\n" unless self.address.blank?
      self.body << "City: #{self.city}\\n" unless self.city.blank?
      self.body << "State: #{self.state}\\n" unless self.state.blank?
      self.body << "Zip: #{self.zip}\\n" unless self.zip.blank?
      self.body << "Resident Status: #{self.resident_status}\\n" unless self.resident_status.blank?
      self.body << "Resident Relationship: #{self.resident_relationship}\\n" unless self.resident_relationship.blank?
      self.body << "Property Type: #{self.property_type}\\n" unless self.property_type.blank?
      self.body << "Condition: #{self.condition}\\n" unless self.condition.blank?
      self.body << "Lot Size: #{self.lot_size}\\n" unless self.lot_size.blank?
      self.body << "Square Footage: #{self.square_footage}\\n" unless self.square_footage.blank?
      self.body << "Basement: #{self.basement}\\n" unless self.basement.blank?
      self.body << "Style: #{self.style}\\n" unless self.style.blank?
      self.body << "Year Built: #{self.year_built}\\n" unless self.year_built.blank?
      self.body << "Fireplace: #{self.fireplace}\\n" unless self.fireplace.blank?
      self.body << "Moving?: #{self.moving}\\n" unless self.moving.blank?
      self.body << "Bedrooms: #{self.bedrooms}\\n" unless self.bedrooms.blank?
      self.body << "Bathrooms: #{self.bathrooms}\\n" unless self.bathrooms.blank?
      self.body << "Parking: #{self.parking}\\n" unless self.parking.blank?
      self.body << "Parking Spaces: #{self.parking_spaces}\\n" unless self.parking_spaces.blank?
      self.body << "Listing Status: #{self.listing_status}\\n" unless self.listing_status.blank?
      self.body << "Planning to sell?: #{self.planning}\\n" unless self.planning.blank?
      self.body << "Heat Type: #{self.heat_type}\\n" unless self.heat_type.blank?
      self.body << "AC Type: #{self.ac_type}\\n" unless self.ac_type.blank?
      self.body << "Neighborhood: #{self.neighborhood}\\n" unless self.neighborhood.blank?
      self.body << "Pool: #{self.pool}\\n" unless self.pool.blank?
      self.body << "Comments: #{self.comments}\\n" unless self.comments.blank?
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
