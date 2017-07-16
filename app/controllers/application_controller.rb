class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def create(object)
    if object.save
      redirect_to movie_path(object)
      flash[:success]= "Create complited"
    else
      render 'new'
    end
  end

  def update(object)
    if object.save
      redirect_to object_path(object)
      flash[:success]= "Update complited"
    else
      render 'edit'
    end
  end

  def destroy(object)
    object.object
    redirect_to object_path
    flash[:danger] = "Was deleted"
  end


end
