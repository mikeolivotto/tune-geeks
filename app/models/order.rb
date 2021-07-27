class Order < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: 'Profile'
end
