class CamerasController < ApplicationController

	layout "main"

  def index
    @cameras = Camera.all
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def create
    @camera = Camera.new(params[:camera])

    respond_to do |format|
      if @camera.save
        format.html { redirect_to @camera, notice: 'Camera was successfully created.' }
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
        format.html { redirect_to @camera, notice: 'Camera was successfully updated.' }
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
      format.html { redirect_to cameras_url }
      format.json { head :no_content }
    end
  end
end