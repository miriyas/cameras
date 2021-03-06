class Admin::CamerasController < ApplicationController

  before_filter :require_admin

	layout "admin"

  def index
    s = Camera.search(params[:search])
		if params[:company].present?
			if params[:company] == "sony/minolta"
				s = s.where("company LIKE 'sony' OR company LIKE 'minolta'") 
			elsif params[:company] == "etc"
				s = s.where("company LIKE 'leica' OR company LIKE 'sigma' OR company LIKE 'contax'") 
			else
				s = s.where(company: params[:company])
			end
			s = s.order('release_date DESC')
		else
			s = s.order('id DESC')
		end
	  @cameras = s.page(params[:page]).per(20)
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
      redirect_to admin_root_path
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
      redirect_to_back_or_default admin_root_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy

    redirect_to_back_or_default admin_root_path
  end
end