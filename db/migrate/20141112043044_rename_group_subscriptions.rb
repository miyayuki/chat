class RenameGroupSubscriptions < ActiveRecord::Migration
  def change
		rename_column :group_subscriptions, :groupID, :group_id
		rename_column :group_subscriptions, :userID, :user_id
  end
end
