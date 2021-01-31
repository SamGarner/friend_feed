class FriendRequest < ApplicationRecord
  # validates :sender_id, :receiver_id, presence: true
  # validates :sender_id, uniqueness: { scope: :receiver_id }

  # belongs_to :sender, class_name: 'User'
  # belongs_to :receiver, class_name: 'User'

  # def self.sent_requests(user_id)
  #   FriendRequest.where('sender_id = ?', user_id)
  # end

  # def self.received_requests(user_id)
  #   FriendRequest.where('receiver_id = ?', user_id)
  # end
end
