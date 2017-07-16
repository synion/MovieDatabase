class StatsPageController < ApplicationController
  expose(:best_sell) { Movie.best_sell }
  expose(:most_played) { Actor.most_played }
  expose(:most_popular) { Genre.most_popular}

end
