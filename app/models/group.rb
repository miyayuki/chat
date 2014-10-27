class Group < ActiveRecord::Base
  has_many :group_subscriptions, foreign_key: 'groupID'
#	attr_accessor :freezeflag

	def freezeflag
	end

end
