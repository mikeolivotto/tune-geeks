class Order < ApplicationRecord
  belongs_to :listing
  has_many :reviews
  belongs_to :buyer, class_name: 'Profile'
end
