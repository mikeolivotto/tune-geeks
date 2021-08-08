class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_one :address
  has_many :listings, foreign_key: 'seller_id'
  has_many :orders, foreign_key:'buyer_id'
  has_many :reviews, foreign_key: 'reviewer_id'
  has_many :reviews, foreign_key: 'reviewee_id'

  # has_many :seller_listings, class_name: 'Listing', foreign_key: 'seller_id'
  # has_many :buyer_orders, class_name: 'Order', foreign_key: 'buyer_id'
  # has_many :reviewer_reviews, class_name: 'Review', foreign_key: 'reviewer_id'
  # has_many :reviewee_reviews, class_name: 'Review', foreign_key: 'reviewee_id'


  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
end
