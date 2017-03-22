require 'nokogiri'
require 'open-uri'
class Movie < ActiveRecord::Base

  has_many :ratings
  has_many :users, through: :ratings

  def self.year_released (year_r)
  	self.all.select {|movie| movie if movie.year == year_r}
  end

  def average_rating
  	sum = 0.0
    if self.ratings.count == 0
      "No Rating Yet"
    else
  	   self.ratings.each {|rating| sum += rating.star}
  	   sum / self.ratings.count
     end
  end

  def self.bulk_add_movie (link)
    doc = Nokogiri::HTML(open(link))
    array = doc.css("div.list_item")
    array.collect do |item|
      pic_url = item.css("div.hover-over-image img.poster").attr('src').value
      name_year = item.css("h4 a").text
      movie_name = name_year.slice(1, name_year.length-8)
      year = name_year.slice(name_year.length-5, 4)
      description = item.css("div.outline").text.strip!

      Movie.create(pic_url: pic_url, name: movie_name, year: year, description: description)
    end
  end


end
