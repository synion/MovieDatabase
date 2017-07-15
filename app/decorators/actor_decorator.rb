class ActorDecorator < ApplicationDecorator
  def full_name
    "#{first_name} #{last_name}"
  end
  def three_movies
    movies.shuffle.first(3)
  end
end
