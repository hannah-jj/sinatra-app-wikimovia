require './config/environment'

class RatingsController < ApplicationController


  get '/ratings/:id' do
    erb :'ratings/show'
  end



end
