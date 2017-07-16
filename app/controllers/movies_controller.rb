class MoviesController < ApplicationController
  expose :movies,  ->{ Movie.all }
  expose :movie
  expose(:movie, attributes: :movie_params)
  expose :actors,  ->{ Actor.all }
  expose :genre,   ->{ Genre.all }

  def create
    if movie.save
      redirect_to movie_path(movie)
      flash[:success]= "Create Movie complited"
    else
      render 'new'
    end
  end

  def update
    if movie.save
      redirect_to movie_path(movie)
      flash[:success]= "Update complited"
    else
      render 'edit'
    end
  end

  def destroy
    movie.destroy
    redirect_to movie_path
    flash[:danger] = "Movie was deleted"
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :revenue, :genre_id, [:id, :name], actor_ids: [])
  end
end
