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

require 'test_helper'

class CameraTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
