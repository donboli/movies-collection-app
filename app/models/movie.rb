class Movie < ApplicationRecord
  mount_uploaders :pictures, PictureUploader

  belongs_to :user

  acts_as_tenant(:user)
end
