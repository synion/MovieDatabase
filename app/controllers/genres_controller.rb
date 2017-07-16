class GenresController < ApplicationController
  expose :genres { Genre.all }
  expose :genre

  def create(genre)  end;
  def update(genre)  end;
  def destroy(genre) end;

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
