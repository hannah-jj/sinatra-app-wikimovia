require './config/environment'

class MoviesController < ApplicationController
use Rack::MethodOverride

  get '/movies' do
    if logged_in?
      erb :'movies/index'
    else
      @message = "Please Log In first to access the contents"
      erb :'users/login'
    end
  end

  get '/movies/new' do
    if logged_in?
      erb :'movies/new'
    else
      @message = "Please Log In first to access the contents"
      erb :'users/login'
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
      erb :'movies/show'
    else
      @message = "Please Log In first to access the contents"
      erb :'users/login'
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
      @message = "Please Log In first to access the contents"
      erb :'users/login'
    end
  end




end
