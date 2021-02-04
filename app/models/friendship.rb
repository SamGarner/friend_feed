class Friendship < ApplicationRecord
  validates :sender_id, :receiver_id, presence: true
  validates :sender_id, uniqueness: { scope: :receiver_id }

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

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

  def self.connections(user_id)
    (self.outstanding_requests(user_id) + self.friends(user_id)).uniq
  end

  private

  def self.outstanding_requests(user_id)
    pending_friendships = Friendship.where('(receiver_id = ? OR sender_id = ?)
                                            AND is_request = ?', user_id, user_id, true)
    pending_friend_ids = []
    pending_friendships.each do |friendship|
      pending_friend_ids << friendship.sender_id
      pending_friend_ids << friendship.receiver_id
    end
    pending_friend_ids.uniq
  end
end
