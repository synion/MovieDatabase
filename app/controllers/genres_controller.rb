class GenresController < ApplicationController
  expose :genres { Genre.all }
  expose :genre
end
