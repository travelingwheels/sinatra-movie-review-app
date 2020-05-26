require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "movie_review_app"
  end

  get "/" do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find_by(:id session[:user_id])
  end
end
