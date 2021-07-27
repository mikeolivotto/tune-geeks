class Listing < ApplicationRecord
  belongs_to :artist
  belongs_to :seller, class_name: 'Profile'
  has_many_attached :images
end
