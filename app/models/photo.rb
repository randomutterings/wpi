class Photo < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :photo, 
                    :styles => { :small => "100x100>",
                                 :medium => "300x300>",
                                 :large => "600x600>" }
end
