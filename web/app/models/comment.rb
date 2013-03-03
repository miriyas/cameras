# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(255)
#  content_id   :integer
#  content_type :string(255)
#  body         :text
#  user_ip      :string(255)
#  password     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :password, :user_id, :user_ip

	belongs_to :user, :counter_cache => true, touch: true
  belongs_to :content, :polymorphic => true, :counter_cache => true, touch: true
  
	validates_length_of :body, :minimum => 1
	
end

# rails g model link name:string url:string content:string