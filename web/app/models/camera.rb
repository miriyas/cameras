# == Schema Information
#
# Table name: cameras
#
#  id              :integer          not null, primary key
#  name1           :string(255)
#  name2           :string(255)
#  company         :string(255)
#  class_range     :string(255)
#  release_date    :date
#  sensor_type     :string(255)
#  sensor_size     :string(255)
#  sensor_pixel    :integer
#  image_processor :string(255)
#  mirror_type     :string(255)
#  finder_magnify  :float
#  finder_coverage :integer
#  metering        :string(255)
#  fps             :float
#  shutter_speed   :integer
#  lcd_size        :float
#  lcd_pixel       :integer
#  lcd_type        :string(255)
#  af_points_total :integer
#  af_points_cross :integer
#  af_sensor       :string(255)
#  iso_high        :integer
#  iso_low         :integer
#  liveview        :boolean
#  shake_reduction :boolean
#  v720fps         :integer
#  v1080fps        :integer
#  video_format    :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image           :string(255)
#  name3           :string(255)
#  v1080scan       :string(255)
#  more_info       :text
#  v720scan        :string(255)
#

class Camera < ActiveRecord::Base
  attr_accessible :name1, :name2, :name3, :company, :class_range, :release_date, :image, :more_info,
	:sensor_type, :sensor_size, :sensor_pixel, :image_processor, :iso_high, :iso_low,
	:mirror_type, :finder_magnify, :finder_coverage, :metering, :fps, :shutter_speed,
	:af_points_total, :af_points_cross, :af_sensor, :shake_reduction,  
	:lcd_size, :lcd_pixel, :lcd_type, :liveview, :storage, :sealing,
	:v720fps, :v720scan, :v1080fps, :v1080scan, :video_format,
	:weight, :d_width, :d_height, :d_depth, :mount, :power, :status

  mount_uploader :image, ImageUploader
  has_many :comments, :as => :content, :dependent => :destroy
  has_many :links, :as => :content, :dependent => :destroy


  validates_presence_of :name1, :on => :create

  scope :of_running, where("status = 'running'")
  scope :of_pending, where("status = 'pending'")


	def self.search(search)
		if search
			where("name1 LIKE '%#{search}%' OR name2 LIKE '%#{search}%' OR name3 LIKE '%#{search}%'")
		else
			self
		end
	end
end
