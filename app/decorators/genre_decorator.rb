class GenreDecorator < ApplicationDecorator
  def number_of_movie
    "Number of movies: #{movies.size.to_s}"
  end
end
