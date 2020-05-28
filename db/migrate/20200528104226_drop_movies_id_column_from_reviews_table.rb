class DropMoviesIdColumnFromReviewsTable < ActiveRecord::Migration
  def change
    remove_column :reviews, :movies_id
  end
end
