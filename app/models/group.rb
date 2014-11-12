class Group < ActiveRecord::Base
	has_many :users, through: :group_subscriptions
  has_many :group_subscriptions, foreign_key: 'group_id'
  has_many :group_masters, foreign_key: 'group_id'
	has_many :messages
#	attr_accessor :freezeflag

	def freezeflag
	end
	

end
