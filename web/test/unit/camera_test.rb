# == Schema Information
#
# Table name: cameras
#
#  id               :integer          not null, primary key
#  name1            :string(255)
#  name2            :string(255)
#  company          :string(255)
#  class_range      :string(255)
#  release_date     :date
#  sensor_type      :string(255)
#  sensor_size      :string(255)
#  sensor_pixel     :integer
#  image_processor  :string(255)
#  mirror_type      :string(255)
#  finder_magnify   :float
#  finder_coverage  :integer
#  metering         :string(255)
#  fps              :float
#  shutter_speed    :integer
#  lcd_size         :float
#  lcd_pixel        :integer
#  lcd_type         :string(255)
#  af_points_total  :integer
#  af_points_cross  :integer
#  af_sensor        :string(255)
#  iso_high         :integer
#  iso_low          :integer
#  liveview         :boolean
#  shake_reduction  :boolean
#  video_resolution :integer
#  video_fps        :integer
#  video_format     :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  image            :string(255)
#  name3            :string(255)
#  video_scanning   :string(255)
#  more_info        :text
#

require 'test_helper'

class CameraTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
