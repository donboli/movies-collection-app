class Movie < ApplicationRecord
  mount_uploaders :pictures, PictureUploader

  belongs_to :user

  validates :name, presence: true

  acts_as_tenant(:user)
end
