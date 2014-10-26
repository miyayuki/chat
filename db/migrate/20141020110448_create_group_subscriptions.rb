class CreateGroupSubscriptions < ActiveRecord::Migration
  def change
    create_table :group_subscriptions do |t|
      t.integer :groupID
      t.integer :userID

      t.timestamps
    end
  end
end
