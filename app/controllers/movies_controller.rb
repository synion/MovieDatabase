class MoviesController < ApplicationController
  expose :movies { Movie.all }
  expose :movie
end
