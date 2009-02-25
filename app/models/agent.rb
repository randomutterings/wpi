class Agent < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :small => "120x120>", :original => "200x200>" }
  
  def email_with_name
   "#{self.first_name} #{self.last_name} <#{self.email}>"
  end

end
