class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login'
  end

  #This route finds the user and logs them in(create a session)
  post '/login' do

  end
end
