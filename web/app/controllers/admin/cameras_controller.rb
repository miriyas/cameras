class Admin::CamerasController < ApplicationController

  before_filter :require_admin

	layout "admin"

  def index
    @cameras = Camera.search(params[:search]).order('id DESC').page(params[:page]).per(10)
  end


  def show
    @camera = Camera.find(params[:id])
    @comments = @camera.comments
		@comment = Comment.new
    @links = @camera.links
		@link = Link.new
  end


  def new
    @camera = Camera.new(params[:camera])
  end
	
  def create
    @camera = Camera.new(params[:camera])

    if @camera.save
      redirect_to admin_cameras_path
    else
      render action: 'new'
    end
  end
	
  def edit
    @camera = Camera.find(params[:id])
  end
  def update
    @camera = Camera.find(params[:id])    
    if @camera.update_attributes(params[:camera])
      redirect_to_back_or_default admin_cameras_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy

    redirect_to_back_or_default admin_cameras_path
  end
end