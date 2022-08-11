class Item < ApplicationRecord
  # relation
  belongs_to :category
  has_many :reviews
  has_many :favorites
  has_many :users, through: :favorites

  # carrierwave
  mount_uploader :image, ImageUploader
end
