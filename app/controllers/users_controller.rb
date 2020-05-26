class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  #This route finds the user and logs them in(create a session)
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/reviews/show'
    else
      redirect '/users/signup'
    end
  end
end
