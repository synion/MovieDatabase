class ActorsController < ApplicationController
  expose :actors,  ->{ Actor.all }
  expose :actor
  expose(:actor, attributes: :actor_params)
  expose :movies,  ->{ Movie.all }

  def create(actor)  end;
  def update(actor)  end;
  def destroy(actor) end;

  private
  def actor_params
    params.require(:actor).permit(:first_name, :last_name, movie_ids: [])
  end
end
