class Listing < ActiveRecord::Base
  belongs_to :lead
  belongs_to :status
  
  attr_accessor :status_name
  
  before_save :create_status_from_name
  
  def create_status_from_name
    status = Status.find_by_name(status_name)
    if status.nil?
      unless status_name.blank?
        new_status = Status.create(:name => status_name)
        self.status_id = new_status.id
      end
    else
      self.status_id = status.id
    end
  end
end
