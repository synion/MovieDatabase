class GenreDecorator < ApplicationDecorator
  def number_of_movie
    movies.size
  end
end
