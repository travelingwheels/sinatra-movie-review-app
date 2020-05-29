class ReviewsController < ApplicationController


  get'/reviews' do
    if logged_in?
      @reviews = Review.all
      erb :'reviews/index'
    end
  end

  get'/reviews/new' do
    if logged_in?
      erb :'reviews/new'
    else
      redirect '/users/login'
    end
  end

  post'/reviews' do

  end
end
