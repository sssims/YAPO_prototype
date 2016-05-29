class User < ActiveRecord::Base
  
  has_many :journals

  attr_accessor :password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 1..20 }
  validates :email, :uniqueness => true, :format => EMAIL_REGEX, :allow_blank => true
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save  :clear_password

  def encrypt_password

    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end

  end

  def clear_password
    self.password = nil
  end

end
