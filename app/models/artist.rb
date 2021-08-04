class Artist < ApplicationRecord
    has_many :listings

    validates :name, presence: true


    def self.random
        Artist.pluck(:name).sample(1)[0].titlecase
    end


    def self.currently_listed
        unique_artist_ids = Listing.select(:artist_id).distinct
        unique_artists = []
        unique_artist_ids.each do |artist|
            unique_artists.push(Artist.find(artist.artist_id))
        end

        unique_artists

    end

end
