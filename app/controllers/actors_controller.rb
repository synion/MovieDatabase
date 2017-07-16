class ActorsController < ApplicationController
  expose :actors,  ->{ search.result.paginate(page: params[:page], per_page: 10) }
  expose :actor
  expose(:actor, attributes: :actor_params)
  expose :movies,  ->{ Movie.all }
  expose :search,  ->{ Actor.ransack(params[:q]) }

  def create
    if actor.save
      flash[:success]= "Create Actor complited"
      redirect_to actor_path(actor)
    else
      render 'new'
    end
  end

  def update
    if actor.update(actor_params)
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
