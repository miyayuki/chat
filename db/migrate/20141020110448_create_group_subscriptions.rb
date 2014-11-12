class CreateGroupSubscriptions < ActiveRecord::Migration
  def change
    rename_colulm :group_subscriptions do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
