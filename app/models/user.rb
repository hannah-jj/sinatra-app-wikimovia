class User < ActiveRecord::Base

  has_many :ratings
  has_many :movies, through: :ratings
  has_secure_password

  validates :email, :username, presence: true 
  validates :email, :username, uniqueness: true
  validates :password, length: { in: 6..20 }

end
