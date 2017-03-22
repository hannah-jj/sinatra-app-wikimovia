
#optional cleanse all tables

Movie.destroy_all
ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'movies'")
User.destroy_all
ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'users'")
Rating.destroy_all
ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'ratings'")


#find any list of movies on imdb to seed the movie table.  
#Must use the list that displays big picture, with year and short description.
#the scraper in movie.rb only knows how to scrape those links

#example links:
#http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1
#http://www.imdb.com/list/ls051507615/

#scrape movie info from imdb to fill out the movies table
Movie.bulk_add_movie ('http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1')

