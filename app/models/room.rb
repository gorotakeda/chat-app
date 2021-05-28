class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  # dependentオプションに:destroyを指定した場合、Room（親モデル）が削除されたときに、関連付けしているMessage（子モデル）とRoomUser（子モデル）も削除されます。
    validates :name, presence: true
end
