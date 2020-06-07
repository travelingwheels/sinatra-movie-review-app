class ReviewsController < ApplicationController


  get'/reviews/index' do #shows all reviews
    if logged_in?
      @reviews = Review.all
      #binding.pry
      erb :'reviews/index'
    else
      redirect :'/users/login'
    end
  end

  #get'/reviews/user_review' do
    #if logged_in?
      #@current_user = Review.all
      #binding.pry
      #erb :'reviews/user_review'
    #else
      #redirect :'/users/login'
    #end
  #end

  get'/reviews/new' do #sends to erb form to create a new review
    if logged_in?
      erb :'reviews/new'
    else
      redirect :'/users/login'
    end
  end

  post'/reviews' do #this route gets info from the reviews/new page
    if logged_in?
      if params[:movie_name] == "" || params[:content] == "" || params[:user_id] == ""
        redirect to "/reviews/new"
      else
        @review = current_user.reviews.build(movie_name: params[:movie_name], content: params[:content], user_id: params[:user_id])
        if @review.save
          redirect to "/reviews/#{@review.id}"
        else
          redirect to "/reviews/new"
        end
      end
    else
      redirect to "/users/login"
    end
  end

  #show route for a review
  get '/reviews/:id' do
      @review = Review.find_by_id(params[:id])
      erb:'reviews/show'
  end

  #route to form for updating
  get '/reviews/:id/edit' do
     if logged_in?
       @review = Review.find_by_id(params[:id])
       if @review && @review.user == current_user
         erb :'reviews/edit'
       else
         redirect to '/reviews'
       end
     else
       redirect to '/users/login'
     end
  end

  patch '/reviews/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "reviews/#{params[:id]}/edit"
      else
        @review = Review.find_by_id(params[:id])
        if @review && @review.user == current_user
          if @review.update(content: params[:content])
            redirect to "/reviews/#{@review.id}"
          else
            redirect to "/reviews/#{@review.id}/edit"
          end
        else
          redirect to '/reviews/index'
        end
      end
    else
      redirect to '/users/login'
    end
  end
end
