class RenameGroupMasters < ActiveRecord::Migration
  def change
		rename_column :group_masters, :groupID, :group_id
		rename_column :group_masters, :userID, :user_id
  end
end
