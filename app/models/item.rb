class Item < ApplicationRecord
  # relation
  belongs_to :category

  # carrierwave
  mount_uploader :image, ImageUploader
end
