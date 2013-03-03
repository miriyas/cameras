class Admin::LinksController < ApplicationController

  def index
		@links = Link.all
  end
	
  def create
    @link = Link.new(params[:link])
		@link.save
		p params[:id]
		redirect_to_back_or_default admin_camera_path(params[:camera_id])
  end
	
  def update
    @link = current_user.links.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render action: 'show', handlers: :jbuilder }
      else
        format.html { render action: "edit" }
        format.json { render json: '', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to admin_camera_path(params[:camera_id]) }
    end
  end
end