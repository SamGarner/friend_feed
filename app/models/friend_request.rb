class FriendRequest < ApplicationRecord
  validates :sender_id, :receiver_id, presence: true

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def self.pending_sent_requests(user_id)
    FriendRequest.where('sender_id = ?', user_id)
  end
end
