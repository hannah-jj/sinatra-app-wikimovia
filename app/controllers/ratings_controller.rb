require './config/environment'

class RatingsController < ApplicationController
use Rack::MethodOverride

  get '/ratings/:id' do
    erb :'ratings/show'
  end

  post '/ratings/new' do
  	@rating = Rating.create(params[:rating])
  	redirect "/movies/#{@rating.movie_id}"
  end


end
