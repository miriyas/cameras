class CamerasController < ApplicationController

	layout "main"

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
			s = s.of_showing.order('release_date DESC')
		else
			s = s.of_showing.order('id DESC')
		end
	  @cameras  = s.group_by { |camera| camera.release_date.strftime("%Y") }.sort {|a, b| a[0] <=> b[0] }
		@comments = Comment.order('id DESC').page(params[:page]).per(4)
		
		# total_count = Comment.count
		# page_per = 20
		# offset = total_count % page_per
		# page = params[:page] : 1
		# 
		# cstart = -(page_per*page)
		# cend 	 = -(page_per*(page-1))-1
		# @comments = Comment.all[cstart..cend]
		
		
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