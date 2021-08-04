class Listing < ApplicationRecord
  belongs_to :artist
  belongs_to :seller, class_name: 'Profile'
  has_many_attached :images

  validates :name, presence: true
  validates :artist, presence: true
  validates :price, presence: true


  def self.search(query)
    if query
      return self.where(artist: query)
    end

    return self.all

  end


end
