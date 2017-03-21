require './config/environment'

class RatingsController < ApplicationController
use Rack::MethodOverride

  get '/ratings/new' do
  	if logged_in?
      erb :'ratings/new'
    else
      prompt_login
    end
  end

  post '/ratings/new' do 
  #process edit and new requests b/c only one entry per user per movie is allowed
  	@rating = Rating.find_by(movie_id: params[:rating][:movie_id], user_id: current_user.id)
  	if @rating.nil?
  		@rating = Rating.create(params[:rating])
  	else
  		@rating.update(params[:rating])
  	end
  	redirect "/movies/#{@rating.movie_id}"
  end

  get '/ratings/:id' do
  	if logged_in?
    	erb :'ratings/show'
    else
  		prompt_login
     end
  end

  get '/ratings/:id/edit' do
  	if logged_in?
	  	@rating = Rating.find (params[:id])
	  	if @rating.user == current_user && !@rating.nil?
	  		erb :'ratings/edit'
	  	else
	  		"You don't have permission to edit other users' rating. Or the rating doesn't exist<a href='/'> click here to go back to home page</a>"
	  	end
	else
		prompt_login
	end
  end

  get '/ratings/:id/delete' do
  	if logged_in?
	  	@rating = Rating.find (params[:id])
	  	if @rating.user == current_user
	  		@rating.delete
	  		redirect "/users/#{current_user.id}"
	  	else
	  		"You don't have permission to edit other users' rating. <a href='/'> click here to go back to home page</a>"
	  	end
	 else
	 	prompt_login
	 end
  end



end
