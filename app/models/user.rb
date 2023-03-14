class User < ApplicationRecord
  has_secure_password
  # validates email
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :name, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 4 } 
  validates :password_confirmation, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false} 
  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
   
   if user && user.authenticate(password)
     user
    end
  end
end
