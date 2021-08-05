class Listing < ApplicationRecord
  belongs_to :artist
  belongs_to :seller, class_name: 'Profile'
  has_many_attached :images

  validates :name, presence: true
  validates :artist, presence: true
  validates :price, presence: true


  def self.search(query)
    # Check if query has been provided, AND that the band exists in the DB
    if query && Artist.where(name: query.downcase).exists?
        self.where(artist_id: Artist.find_by_name(query.downcase).id)

    # if there is no search query, then just provide Listing.all
    else
      self.all
    end
  end

  # Checks whether the artist exists in the database
  def self.artist_in_db(query)
    if query
      Artist.where(name: query.downcase).exists? ? true : false
    else
      self.all
    end
  end


end
