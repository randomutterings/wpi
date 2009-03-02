class Page < ActiveRecord::Base
  validates_presence_of :name,
                       :permalink,
                       :content
end
