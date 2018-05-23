class Movie < ApplicationRecord
  mount_uploaders :pictures, PictureUploader

  belongs_to :user
  acts_as_tenant(:user)

  validates :name, presence: true
  validates :rating, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 5
    }
end
