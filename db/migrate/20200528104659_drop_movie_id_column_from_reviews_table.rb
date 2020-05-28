class DropMovieIdColumnFromReviewsTable < ActiveRecord::Migration
  def change
    remove_column :reviews, :movie_id
  end
end
