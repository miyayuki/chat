class CreateGroupMasters < ActiveRecord::Migration
  def change
    create_table :group_masters do |t|
      t.integer :groupID
      t.integer :userID

      t.timestamps
    end
  end
end
