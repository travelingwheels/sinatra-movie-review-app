class UsersController < ApplicationController

  get '/login' do
     if !logged_in?
      erb :'users/login'
     else
      redirect :'/users/show'
    end
  end

  #This route finds the user and logs them in(create a session)
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect :"users/#{@user.id}"
    else
      redirect :'users/signup'
    end
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
        redirect :"/users/#{@user.id}"
      else
         redirect :'users/signup'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
      binding.pry
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
