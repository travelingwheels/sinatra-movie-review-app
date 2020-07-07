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
          flash[:message] = "Awesome you just created a new review!"
          redirect to "/reviews/#{@review.id}"
        else
          flash[:message] = "oops! We need some more information to create a new review."
          redirect to "/reviews/new"
        end
      end
    else
      redirect to "/users/login"
    end
  end

  #show route for a review
  get '/reviews/:id' do
    if logged_in?
      @review = Review.find_by(id: params[:id])
      #binding.pry
      erb:'reviews/show'
    else
      redirect to "/users/login"
    end
  end

  #route to form for updating
  get '/reviews/:id/edit' do
     if logged_in?
       @review = Review.find_by(id: params[:id])
       if @review && @review.user == current_user
         #binding.pry
         erb :'reviews/edit'
       else
         redirect to "/users/#{current_user.id}"
       end
     else
       redirect to '/users/login'
     end
  end

  patch '/reviews/:id' do
    if logged_in?
      if params[:content] && params[:movie_name] == ""
         redirect to "/reviews/#{params[:id]}/edit"
       else
         @review = Review.find(params[:id])
          if @review && @review.user == current_user && params[:content] != ""
              @review.update(content: params[:content], movie_name: params[:movie_name])
             redirect "/reviews/#{@review.id}"
          else
           redirect "users/#{current_user.id}"
          end
         redirect '/'
       end
    end
  end

  delete '/reviews/:id' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      if @review && @review.user == current_user
        @review.destroy
        flash[:message] = "You have successfully deleted that review."
        redirect to '/reviews/index'
      else
        redirect to '/reviews/index'
      end
    end
  end
end
