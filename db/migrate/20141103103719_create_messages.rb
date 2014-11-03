class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :content
      t.datetime :created_id

      t.timestamps
    end
  end
end
