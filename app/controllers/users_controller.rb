require './config/environment'

class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end


  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      @message = "please fill out all fields"
      erb :'users/signup'
    else
      @user = User.create(params)
      session[:id] = @user.id
      redirect to "/movies"
    end
  end


  get '/login' do
  	if logged_in?
  		@message = "You are already logged in as #{current_user.username}. <a href='/logout'> click here to log out</a>"
  		erb :'users/logout'
  	else
  		erb :'users/login'
  	end
  end

  post '/login' do
  	user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect "/users/#{user.slug}"
    else
        @message = "Please enter valid credential"
        erb :"/users/login"
    end
  end

  get '/logout' do
  	if logged_in?
  		session.clear
  		@log_out_message = "You have successfully logged out.<a href='/'> click here to go back to home page</a>"
  		erb :'users/logout'
  	else
  		@message = "You haven't logged in yet. Please log in first."
  		erb :'users/login'
  	end
  end

  get '/users/:slug' do
    if logged_in?
      @user = current_user
      erb :"users/show"
    else
      redirect "/login"
    end
  end

  

end
