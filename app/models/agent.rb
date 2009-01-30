class Agent < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :small => "100x100",
                                 :medium => "300x300>" }
end
