class Account < ActiveRecord::Base
  has_many :permissions
  has_many :documents, :through => :permissions
  
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :full_name, :email, :password, :password_confirmation, :admin
  
  attr_accessor :password
  before_create :prepare_password
  
  validates_presence_of :username, :full_name
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    account = find_by_username(login) || find_by_email(login)
    return account if account && account.matching_password?(pass)
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end
  
  private
  
  def prepare_password
    self.password_salt = Digest::SHA1.hexdigest([Time.now, rand].join)
    self.password_hash = encrypt_password(password)
  end
  
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass, password_salt].join)
  end
  
  def info
    "#{self.full_name} #{self.email}"
  end
  
  def self.no_admins
    self.find_all_by_admin
  end
  
  def self.admins
    self.find_all_by_admin(true)
  end
end
