class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect '/users/#{user.id}'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/login' do
     if !logged_in?
      erb :'users/login'
     else
      redirect '/reviews'
    end
  end

  #This route finds the user and logs them in(create a session)
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/reviews'
    else
      redirect '/users/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
