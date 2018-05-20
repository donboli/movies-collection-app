class Movie < ApplicationRecord
  mount_uploaders :pictures, PictureUploader
end
