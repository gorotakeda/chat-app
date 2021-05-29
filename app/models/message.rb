class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  # 「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しないというバリデーションを設定しています。
end
