class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable and :omniauthable
  validates :email, :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable # non-default modeuls

  has_many :posts
end
