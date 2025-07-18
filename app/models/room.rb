class Room < ApplicationRecord
  belongs_to :user
  has_many :rooms_members, class_name: "Rooms::Member"
  has_many :users, through: :rooms_members, dependent: :destroy
end
