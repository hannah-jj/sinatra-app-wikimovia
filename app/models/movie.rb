class Movie < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :ratings
  has_secure_password

  def self.year_released (year_r)
  end

  def average_rating
  end

end
