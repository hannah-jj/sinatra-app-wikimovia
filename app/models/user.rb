class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :ratings
  has_many :movies, through: :ratings
  has_secure_password

end
