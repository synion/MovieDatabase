class GenresController < ApplicationController
  expose :genres { Genre.all }
  expose :genre

  def create
    if genre.save
      redirect_to genre_path(genre)
      flash[:success]= "Create Genre complited"
    else
      render 'new'
    end
  end

  def update
    if genre.update(genre_params)
      redirect_to genre_path(genre)
      flash[:success]= "Update complited"
    else
      render 'edit'
    end
  end

  def destroy
    genre.destroy
    redirect_to genres_path
    flash[:danger] = "Movie was deleted"
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
