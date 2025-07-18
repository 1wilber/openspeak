class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :owned_rooms, dependent: :destroy, class_name: "Room"

  has_many :rooms_members, class_name: "Rooms::Member"
  has_many :rooms, through: :rooms_members, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
