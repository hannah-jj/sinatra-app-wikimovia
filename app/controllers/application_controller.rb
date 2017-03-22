require './config/environment'

class ApplicationController < Sinatra::Base
use Rack::MethodOverride

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if User.all.empty? #in case of brand new start up with no user at all in the table
      erb :index
  	elsif logged_in?
  		redirect "/movies"
  	else
   		erb :index
   	end
  end

 #helper method
  helpers do
     def logged_in?
       !!session[:id]
     end

     def current_user
       User.find(session[:id])
     end

     def prompt_login
      @message = "Please Log In first to access the contents"
        erb :'users/login'
     end


  end


end
