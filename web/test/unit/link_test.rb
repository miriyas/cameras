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

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
