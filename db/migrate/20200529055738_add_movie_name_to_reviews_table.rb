class AddMovieNameToReviewsTable < ActiveRecord::Migration
  def change
    add_column :reviews, :movie_name, :string
  end
end
