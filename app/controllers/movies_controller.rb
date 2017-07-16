class MoviesController < ApplicationController
  expose :movies,  ->{ Movie.all }
  expose :movie
  expose(:movie, attributes: :movie_params)
  expose :actors,  ->{ Actor.all }
  expose :genre,   ->{ Genre.all }

  def create(movie)  end;
  def update(movie)  end;
  def destroy(movie) end;

  private
  def movie_params
    params.require(:movie).permit(:name, :revenue, :genre_id, [:id, :name], actor_ids: [])
  end
end
