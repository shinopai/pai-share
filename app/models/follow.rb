class Follow < ApplicationRecord
  # relation
  belongs_to :user

  # validation
  validates :user_id, uniqueness: { scope: :follower_id }
end
