class Admin::ClassRangesController < ApplicationController

  before_filter :require_admin

	layout "admin"

  def index
	  @classes = ClassRange.order(:position)
	end

  def new
    @class_range = ClassRange.new(params[:class_range])
  end
	
  def create
    params[:class_range] = process_title(params[:class_range])
		@class_range = ClassRange.new(params[:class_range])
		

    if @class_range.save
      redirect_to admin_class_ranges_path
    else
      render action: 'new'
    end
  end
	
  def edit
    @class_range = ClassRange.find(params[:id])
  end
  def update
    params[:class_range] = process_title(params[:class_range])
    @class_range = ClassRange.find(params[:id])    
    if @class_range.update_attributes(params[:class_range])
	    redirect_to admin_class_ranges_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @class_range = ClassRange.find(params[:id])
    @class_range.destroy

    redirect_to admin_class_ranges_path
  end
end

private

def process_title(params)
	params[:title] = params[:range].to_s + " " + params[:size].to_s
	return params
end