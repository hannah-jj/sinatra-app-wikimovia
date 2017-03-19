class Movie < ActiveRecord::Base

  has_many :ratings
  has_many :users, through: :ratings

  def self.year_released (year_r)
  	self.all.select {|movie| movie if movie.year == year_r}
  end

  def average_rating
  	sum = 0.0
  	self.ratings.each {|rating| sum += rating.star}
  	sum / self.ratings.count
  end

end
