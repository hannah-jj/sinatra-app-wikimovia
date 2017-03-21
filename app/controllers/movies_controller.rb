require './config/environment'

class MoviesController < ApplicationController
use Rack::MethodOverride

  get '/movies' do
    if logged_in?
      erb :'movies/index'
    else
      prompt_login
    end
  end

  get '/movies/new' do
    if logged_in?
      erb :'movies/new'
    else
      prompt_login
    end
  end

  post '/movies/:id' do
    @movie = Movie.new(params[:movie])
    @movie.save
    redirect "/movies/#{@movie.id}"
  end

  get '/movies/:id' do
    if logged_in?
      @movie = Movie.find(params[:id])
      @rating = Rating.find_by(movie_id: @movie.id, user_id: current_user.id) 
      erb :'movies/show'
    else
      prompt_login
    end
  end

  patch '/movies/:id' do
    @movie = Movie.find(params[:id])
    @movie.update(params[:movie])
    @movie.save
    redirect "/movies/#{@movie.id}"
  end

  get '/movies/:id/edit' do
    if logged_in?
      @movie = Movie.find(params[:id])
      erb :'movies/edit'
    else
      prompt_login
    end
  end

end
