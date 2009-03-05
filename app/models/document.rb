class Document < ActiveRecord::Base
  has_attached_file :content
  has_many :permissions
  has_many :accounts, :through => :permissions
  
  def accounts_viewable
    viewable = []
    self.accounts.each do |a|
      viewable << a.full_name if self.accounts.include?(a)
    end
    viewable.to_sentence
  end
  
  def self.viewable(account_id)
    account = Account.find(account_id)
    if account.admin == true
      documents = self.all
    else
      documents = account.documents
    end
    documents
  end
  
end
