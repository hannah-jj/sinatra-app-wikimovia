require './config/environment'

class MoviesController < ApplicationController


  get '/movies' do
    if logged_in?
      @user = current_user
      erb :'movies/index'
    else
      @message = "Please Log In first to access the contents"
      erb :'users/login'
    end
  end



end
