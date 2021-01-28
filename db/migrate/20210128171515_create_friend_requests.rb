class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.bigint :sender_id
      t.bigint :receiver_id
      t.boolean :accepted, null: false, default: false
      t.boolean :rejected, null: false, default: false

      t.timestamps
    end
  end
end
