class ApplicationsController < ApplicationController
  #before_action :authenticate_user!
  
  def index
    @applications = Application.where(user: current_user)
  end

  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:name)

  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      flash[:notice] = "Your Application was successfully created!"
      redirect_to @application
    else
      flash[:error] = "There was an error creating your Application. Please try again."
      render :new
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @application.update_attributes(application_params)
    if @application.save
      flash[:notice] = "Your Application was successfully updated."
      redirect_to @application
    else
      flash[:error] = "There was an error updating your Application. Please try again."
      render :edit
    end
  end

  def destroy
    @application = Application.find(params[:id])
    if @application.destroy
      flash[:notice] = "Your application was deleted"
      redirect_to applications_path
    else
      flash[:error] = "There was an error deleting your Application. Please try again."
      redirect_to :back
    end
  end

  private

  def application_params
    params.require(:application).permit(:name, :url)
  end
end
