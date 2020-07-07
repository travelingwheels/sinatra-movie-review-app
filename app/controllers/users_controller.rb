class UsersController < ApplicationController

  get '/login' do
     if logged_in?
       redirect "/users/#{current_user.id}"
     else
       erb :'users/login'
    end
  end

  #This route finds the user and logs them in(create a session)
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome back #{@user.name}!"
      redirect :"users/#{@user.id}"
    else
      flash[:message] = "We're sorry, but we couldn't validate your credentials,
      please signup or try logging in again"
      redirect :'/users/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect :'/users/show'
    else
    erb :'users/signup'
   end
  end

  post '/users' do
    @user = User.new(params)
     if @user.save
      session[:user_id] = @user.id
        flash[:message] = "Success!! You account has been created."
        redirect :"/users/#{@user.id}"
      else
        flash[:message] = "Sorry, we couldn't create your account:#{@user.errors.full_messages.to_sentence}."
        redirect :'/users/signup'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    @reviews = @user.reviews
    if !logged_in?
      redirect '/'
    else
      #binding.pry
      erb :'users/show'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
