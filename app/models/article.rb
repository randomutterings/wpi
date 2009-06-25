class Article < ActiveRecord::Base
  validates_presence_of :title
  has_attached_file :background_image, 
                    :styles => { :small => "518x100>", :original => "777x150>" }
end
