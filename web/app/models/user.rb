# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  name   		                     :string(255)      not null
#  email                           :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  role                            :string(255)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!

	attr_accessible :email, :name, :role, :password, :password_confirmation
  has_many :comments, :dependent => :destroy

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def admin?
    role == "admin"
  end
end
