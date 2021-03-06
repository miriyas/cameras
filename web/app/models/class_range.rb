class ClassRange < ActiveRecord::Base
  attr_accessible :position, :title, :size, :range
	
	has_many :cameras, :dependent => :nullify
end
# == Schema Information
#
# Table name: class_ranges
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  position   :integer(4)
#  size       :string(255)
#  range      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

