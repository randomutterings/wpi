class Listing < ActiveRecord::Base
  belongs_to  :lead
  belongs_to  :status
  has_many    :photos,
              :dependent => :destroy
  before_save :create_status_from_name
  after_save  :default_primary_photo
  
  accepts_nested_attributes_for :photos, 
                                :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  attr_accessor :status_name, :min_price, :max_price
  
  def self.search(params)
    params[:min_price] = 0 if params[:min_price].blank?
    params[:max_price] = 9999999999 if params[:max_price].blank?
    conditions = "price > #{params[:min_price]} and price < #{params[:max_price]}"
    conditions << " and city = #{params[:city]}" unless params[:city].blank?
    conditions << " and state = #{params[:state]}" unless params[:state].blank?
    conditions << " and zip = #{params[:zip]}" unless params[:zip].blank?
    conditions << " and county = #{params[:county]}" unless params[:county].blank?
    conditions << " and bedrooms = #{params[:bedrooms]}" unless params[:bedrooms].blank?
    conditions << " and bathrooms = #{params[:bathrooms]}" unless params[:bathrooms].blank?
    listings = self.all(:conditions => conditions)
  end
  
  def default_primary_photo
    if primary_photo.nil?
      logger.error "primary photo is nil"
      unless self.photos.empty?
        self.photos.first.primary = true
        self.photos.first.save
      end
    end
  end
  
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
  
  def primary_photo
    self.photos.find_by_primary(true)
  end
  
end
