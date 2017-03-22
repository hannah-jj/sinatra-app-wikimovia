# sinatra-app-wikimovia

Finally, we can give a movie 0 star rating and it counts!!!

A Sinatra app that utilizes ActiveRecord.  The app displays movies with title, year and short description. User can sign up and log in to rate the movies. Rating ranges from 0 to 5 stars and/or a short review.  User can edit and add movie, but not delete movie.  User can rate one movie once, can view other users' review, but can only edit one's own review.

To use this app, please follow below steps:

'''
bundle install
rake db:seed <== optional: this will restart database and populate movies currently in theater as found on www.imdb.com
shotgun <== to run the localhost server to access the app

'''



Link to license : https://github.com/hannah11361/sinatra-app-wikimovia/blob/master/LICENSE.txt

