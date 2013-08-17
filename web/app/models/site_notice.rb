class SiteNotice < ActiveRecord::Base
  attr_accessible :todo, :worked
end
# == Schema Information
#
# Table name: site_notices
#
#  id         :integer(4)      not null, primary key
#  worked     :text
#  todo       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

