# == Schema Information
#
# Table name: cameras
#
#  id              :integer(4)      not null, primary key
#  name1           :string(255)
#  name2           :string(255)
#  company         :string(255)
#  release_date    :date
#  sensor_type     :string(255)
#  sensor_size     :string(255)
#  sensor_pixel    :integer(4)
#  image_processor :string(255)
#  mirror_type     :string(255)
#  finder_magnify  :float
#  finder_coverage :integer(4)
#  metering        :string(255)
#  fps             :float
#  shutter_speed   :integer(4)
#  lcd_size        :float
#  lcd_pixel       :integer(4)
#  lcd_type        :string(255)
#  af_points_total :integer(4)
#  af_points_cross :integer(4)
#  af_sensor       :string(255)
#  iso_high        :integer(4)
#  iso_low         :integer(4)
#  liveview        :boolean(1)
#  shake_reduction :boolean(1)
#  v720fps         :integer(4)
#  v1080fps        :integer(4)
#  video_format    :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  image           :string(255)
#  name3           :string(255)
#  v1080scan       :string(255)
#  more_info       :text
#  v720scan        :string(255)
#  links_count     :integer(4)
#  storage         :string(255)
#  weight          :float
#  d_width         :float
#  d_height        :float
#  d_depth         :float
#  mount           :string(255)
#  power           :string(255)
#  status          :string(255)
#  sealing         :boolean(1)      default(FALSE)
#  lcd_etc         :string(255)
#  class_range_id  :integer(4)
#

class Camera < ActiveRecord::Base
  attr_accessible :name1, :name2, :name3, :company, :class_range_id, :release_date, :image, :more_info,
	:sensor_type, :sensor_size, :sensor_pixel, :image_processor, :iso_high, :iso_low,
	:mirror_type, :finder_magnify, :finder_coverage, :metering, :fps, :shutter_speed,
	:af_points_total, :af_points_cross, :af_sensor, :shake_reduction,  
	:lcd_size, :lcd_pixel, :lcd_type, :lcd_etc, :liveview, :storage, :sealing,
	:v720fps, :v720scan, :v1080fps, :v1080scan, :video_format,
	:weight, :d_width, :d_height, :d_depth, :mount, :power, :status

  mount_uploader :image, ImageUploader
  has_many :comments, :as => :content, :dependent => :destroy
  has_many :links, :as => :content, :dependent => :destroy
	belongs_to :class_range

  validates_presence_of :name1, :on => :create

  scope :of_running, where("status = 'running'")
  scope :of_pending, where("status = 'pending'")

  SENSORS = [:'APS-C', :'FF', :'APS-H', :'4/3', :'6.4x4.8mm', :'18x12mm', :'645(44x33mm)', :'S(45x30mm)', :'20.5x16.4mm', :'14x9.3mm', :'13.8x9.2mm', :'27.6x18.4']


	def self.search(search)
		if search
			where("name1 LIKE '%#{search}%' OR name2 LIKE '%#{search}%' OR name3 LIKE '%#{search}%' OR company LIKE '%#{search}%'")
		else
			self
		end
	end
end
