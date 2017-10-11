class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]
    @application.user = current_user

    if @application.save
      flash[:notice] = "Application was saved."
      redirect_to [current_user, @application]
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :new
    end
  end

  def destroy
    @application = Application.find(params[:id])
    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to user_applications_path
    else
      flash.now[:alert] = "There was an error deleting the application."
      render :show
    end
  end
end
