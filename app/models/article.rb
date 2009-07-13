class Article < ActiveRecord::Base
  validates_presence_of :title
  has_attached_file :background_image, 
                    :styles => { :small => "518x100>", :original => "840x150>" }
end
