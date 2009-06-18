class Flyer < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :original => "200x400>" }
end
