class ReviewsController < ApplicationController


  get'/reviews/show' do
    erb :'reviews/show'
  end
end
