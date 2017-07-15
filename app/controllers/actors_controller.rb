class ActorsController < ApplicationController
  expose :actors,  ->{ Actor.all }
  expose :actor
  expose(:actor, attributes: :actor_params)
  expose :movies,  ->{ Movie.all }

  def create
    if actor.save
      redirect_to actor_path(actor)
      flash[:success]= "Create Actor complited"
    else
      render 'new'
    end
  end

  def update
    if actor.save
      redirect_to actor_path(actor)
      flash[:success]= "Update complited"
    else
      render 'edit'
    end
  end

  def destroy
    actor.destroy
    redirect_to actors_path
    flash[:danger] = "Actor was deleted"
  end

  private
  def actor_params
    params.require(:actor).permit(:first_name, :last_name, movie_ids: [])
  end
end
