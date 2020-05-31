class ReviewsController < ApplicationController


  get'/reviews/index' do
    if logged_in?
      @reviews = Review.all
      #binding.pry
      erb :'reviews/index'
    else
      redirect :'/users/login'
    end
  end

  get'/reviews/new' do
    if logged_in?
      erb :'/reviews/new'
    else
      redirect :'users/login'
    end
  end

  post'/reviews' do

  end
end
