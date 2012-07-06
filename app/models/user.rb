class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :propositions, :inverse_of => :user
  has_many :oppositions, :inverse_of => :user  

  before_save { |user| user.email = email.downcase }

  validates :email, presence:   true, 
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }  
  validates :name, presence: true, length: { maximum: 49 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
