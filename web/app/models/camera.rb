# == Schema Information
#
# Table name: cameras
#
#  id               :integer         not null, primary key
#  name1            :string(255)
#  name2            :string(255)
#  company          :string(255)
#  class_range      :string(255)
#  release_date     :datetime
#  sensor_type      :string(255)
#  sensor_size      :string(255)
#  sensor_pixel     :integer
#  image_processor  :string(255)
#  mirror_type      :string(255)
#  mirror_magnify   :string(255)
#  mirror_coverage  :string(255)
#  metering         :string(255)
#  fps              :integer
#  shutter_speed    :integer
#  lcd_size         :integer
#  lcd_pixel        :integer
#  lcd_type         :string(255)
#  af_points_total  :integer
#  af_points_cross  :integer
#  af_sensor        :string(255)
#  iso_high         :integer
#  iso_low          :integer
#  liveview         :boolean
#  shake_reduction  :integer
#  video_resolution :integer
#  video_fps        :integer
#  video_format     :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Camera < ActiveRecord::Base
  attr_accessible :name1, :name2

  # validates_presence_of :name1, :on => :create
end