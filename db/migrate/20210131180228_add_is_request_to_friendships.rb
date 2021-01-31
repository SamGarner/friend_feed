class AddIsRequestToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :is_request, :boolean, null: false, default: true
  end
end
