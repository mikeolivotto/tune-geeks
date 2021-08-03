class Listing < ApplicationRecord
  belongs_to :artist
  belongs_to :seller, class_name: 'Profile'
  has_many_attached :images


  def self.search(query)
    if query
      return self.where(artist: query)
    end

    return self.all

  end


end
