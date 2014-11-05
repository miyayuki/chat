class Group < ActiveRecord::Base
	has_many :users, through: :group_subscriptions
  has_many :group_subscriptions, foreign_key: 'groupID'
  has_many :group_masters, foreign_key: 'groupID'
	has_many :messages, foreign_key: 'group_id'
#	attr_accessor :freezeflag

	def freezeflag
	end
	

end
