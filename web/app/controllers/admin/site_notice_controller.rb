class Admin::SiteNoticeController < ApplicationController

  before_filter :require_admin

	layout "admin"

	def index
		@site_notice = SiteNotice.first
	end

	def edit
		@site_notice = SiteNotice.find(params[:site_notice])
	end

	def update
		site_notice = SiteNotice.find(params[:id])
		if site_notice.update_attributes(params[:site_notice])
			redirect_to admin_site_notice_index_path
		else
      render action: 'edit'
		end
	end
	
end