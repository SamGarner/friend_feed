class AddSenderReceiverUniqueIndexToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :friend_requests, [:sender_id, :receiver_id], unique: true
  end
end
