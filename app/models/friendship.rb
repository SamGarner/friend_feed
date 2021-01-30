class Friendship < ApplicationRecord
  validates :sender_id, :receiver_id, presence: true
  validates :sender_id, uniqueness: { scope: :receiver_id }
end
