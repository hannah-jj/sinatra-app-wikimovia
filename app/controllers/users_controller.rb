require './config/environment'

class UsersController < ApplicationController
use Rack::MethodOverride

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
    if User.all.empty? #in case of brand new start up with no user at all in the table
  	  @message = "No user in the database, please sign up one to get started"
      erb :'users/signup'
    elsif logged_in?
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
        redirect "/users/#{user.id}"
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
  		prompt_login
  	end
  end

  get '/users/:id' do
    if logged_in?
      @user = User.find(params[:id])
      erb :"users/show"
    else
      prompt_login
    end
  end

  patch '/users/:id' do
  	@user = User.find(params[:id])
  	if params[:user][:username] == "" || params[:user][:email] == "" || params[:user][:password] == ""
      "Please fill out all fields.<a href='/users/#{@user.id}/edit'> click here to go back to edit</a>"
     else
     	@user.update(params[:user])
     	@user.save
     	redirect "/users/#{@user.id}"
     end

  end


  get '/users/:id/edit' do
    if logged_in?
      erb :"users/edit"
    else
      prompt_login
    end
  end


  

end
