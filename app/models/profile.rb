class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_one :address
  has_many :listings, foreign_key: 'seller_id'
  has_many :orders, foreign_key:'buyer_id'
  has_many :reviews, foreign_key: 'reviewer_id'
  has_many :reviews, foreign_key: 'reviewee_id'



  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
end
