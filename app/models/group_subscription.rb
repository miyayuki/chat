class GroupSubscription < ActiveRecord::Base
	belongs_to :user, foreign_key: 'userID'
	belongs_to :group, foreign_key: 'groupID'
end
