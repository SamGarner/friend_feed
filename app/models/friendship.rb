class Friendship < ApplicationRecord
  validates :sender_id, :receiver_id, presence: true
  validates :sender_id, uniqueness: { scope: :receiver_id }

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

# private

  def self.sent_requests(user_id)
    Friendship.where('sender_id = ? AND is_request = ?', user_id, true)
  end

  def self.received_requests(user_id)
    Friendship.where('receiver_id = ? AND is_request = ?', user_id, true)
  end

  def self.friends(user_id)
    friendships = Friendship.where('(receiver_id = ? OR sender_id = ?) AND is_request = ?',
                                   user_id, user_id, false)
    friend_ids = []
    friendships.each do |friendship|
      friend_ids << friendship.sender_id
      friend_ids << friendship.receiver_id
    end
    friend_ids.uniq
  end
end
