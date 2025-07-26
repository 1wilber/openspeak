class Rooms::Member < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :room, uniqueness: { scope: :user }
end
