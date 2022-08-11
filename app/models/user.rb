class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # validation
  validates :name,
            presence: true,
            length: { maximum: 20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # carrierwave
  mount_uploader :image, ImageUploader

  # relation
  belongs_to :age
  belongs_to :gender
  belongs_to :residence
  has_many :reviews
  has_many :favorites
  has_many :items, through: :favorites
end
