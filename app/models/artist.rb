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
            # Pushes the whole artist record into unique_artists array
            unique_artists.push(Artist.find(artist.artist_id))
        end

        unique_artists

    end

    def self.sorted_artists
        artist_names = []
        # Use the id's to get artist names and push them into artist_names array
        Artist.currently_listed.each do |artist|
            artist_names.push(artist.name)
        end

        # Sort and mutate the array so artist names are alphabetical
        artist_names = artist_names.sort

        sorted_artist_array = []
        # Build a new array of all artist records, sorted by name
        artist_names.each do |artist|
            sorted_artist_array.push(Artist.find_by_name(artist))
        end

        sorted_artist_array
    end



end
