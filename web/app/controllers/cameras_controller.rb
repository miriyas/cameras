class CamerasController < ApplicationController

	layout "main"

  def index
    s = Camera.search(params[:search])
		if params[:company].present?
			if params[:company] == "sony/minolta"
				s = s.where("company LIKE 'sony' OR company LIKE 'minolta'") 
			elsif params[:company] == "etc"
				s = s.where("company LIKE 'leica' OR company LIKE 'fujifilm' OR company LIKE 'kodak' OR company LIKE 'sigma'") 
			else
				s = s.where(company: params[:company])
			end
			s = s.order('release_date DESC')
		else
			s = s.order('id DESC')
		end
	  @cameras  = s.group_by { |camera| camera.release_date.strftime("%Y") }.sort {|a, b| a[0] <=> b[0] }
		@comments = Comment.all
		@comment 	= Comment.new
		@user 		= User.new
	end
	

  def show
    @camera = Camera.find(params[:id])
  end

  def create
    @camera = Camera.new(params[:camera])

    respond_to do |format|
      if @camera.save
        format.html { redirect_to root_url, notice: 'Camera was successfully created.' }
        format.json { render action: "show", handlers: :jbuilder }
      else
        format.html { render action: "new" }
        format.json { render json: '', status: :unprocessable_entity }
      end
    end
  end

  def update
    @camera = Camera.find(params[:id])
    
    respond_to do |format|
      if @camera.update_attributes(params[:post])
        format.html { redirect_to root_url, notice: 'Camera was successfully updated.' }
        format.json { render action: "show", handlers: :jbuilder }
      else
        format.html { render action: "edit" }
        format.json { render json: '', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end