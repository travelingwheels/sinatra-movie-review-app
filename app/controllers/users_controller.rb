class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect '/reviews/show'
    end
  end

  get '/login' do
      erb :'users/login'
  end

  #This route finds the user and logs them in(create a session)
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/reviews/show'
    else
      redirect '/users/signup'
    end
  end
end
