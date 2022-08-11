class Review < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :item

  # validation
  validates :body,
            presence: true,
            length: { maximum: 300 }
  validates :star,
            presence: true
  validates :user_id, uniqueness: { scope: :item_id }
end
