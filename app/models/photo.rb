class Photo < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :photo, 
                    :styles => { :thumb => "100x100>",
                                 :small => "170x170>",
                                 :medium => "400x400>" }
end
