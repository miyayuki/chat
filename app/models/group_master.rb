class GroupMaster < ActiveRecord::Base
	belongs_to :user, foreign_key: 'userID'
end
