class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name1
      t.string :name2
      t.string :company
      t.string :class
      t.datetime :release_date
      t.string :sensor_type
      t.string :sensor_size
      t.integer	:sensor_pixel
      t.string	:image_processor
      t.string :mirror_type
      t.string :mirror_magnify
      t.string :mirror_coverage
			t.string	:metering
			t.integer	:fps
			t.integer	:shutter_speed
			t.integer	:lcd_size
			t.integer	:lcd_pixel
			t.string	:lcd_type
			t.integer	:af_points_total
			t.integer	:af_points_cross
			t.string	:af_sensor
			t.integer	:iso_high
			t.integer	:iso_low
			t.boolean	:liveview
			t.integer	:shake_reduction
			t.integer	:video_resolution
			t.integer	:video_fps
			t.integer	:video_format
      t.timestamps
    end
  end
end
