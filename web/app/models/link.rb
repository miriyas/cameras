# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  url          :string(255)
#  content_id   :integer
#  content_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Link < ActiveRecord::Base
  attr_accessible :content, :name, :url, :content_type, :content_id
	
	belongs_to :camera, :counter_cache => true, touch: true
  belongs_to :content, :polymorphic => true, :counter_cache => true, touch: true
	
end
