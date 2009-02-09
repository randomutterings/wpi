class Agent < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :small => "100x100>",
                                 :medium => "300x300>" }
  
  def email_with_name
   "#{self.first_name} #{self.last_name} <#{self.email}>"
  end

end
