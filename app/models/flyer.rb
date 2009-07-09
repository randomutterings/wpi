class Flyer < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :original => "400x100>" }
end
