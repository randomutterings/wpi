class Article < ActiveRecord::Base
  validates_presence_of :title,
                        :content
  
  has_attached_file :background_image, 
                    :styles => { :news => "x200>"}
end
