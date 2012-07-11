class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :name, :password, :password_confirmation, :id
  has_secure_password
  
  has_many :oppositions, :through => :government_debates 
  has_many :propositions, :through => :opposition_debates
  has_many :government_debates, :class_name => "Debate", :foreign_key => "proposition_user_id"
  has_many :opposition_debates, :class_name => "Debate", :foreign_key => "opposition_user_id"
  has_many :opposition_opponents, :through => :government_debates, :source => :opposition_user
  has_many :government_opponents, :through => :opposition_debates, :source => :proposition_user

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, presence:   true, 
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }  
  validates :name, presence: true, length: { maximum: 49 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

    private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
end
