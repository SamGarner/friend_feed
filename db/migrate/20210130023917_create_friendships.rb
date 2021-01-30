class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.bigint :sender_id
      t.bigint :receiver_id

      t.timestamps

      t.index [:sender_id, :receiver_id], unique: true
    end
  end
end
