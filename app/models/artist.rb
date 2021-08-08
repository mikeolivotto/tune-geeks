class Artist < ApplicationRecord
    has_many :listings

    validates :name, presence: true


    def self.random
        Artist.pluck(:name).sample(1)[0].titlecase
    end

    # Finds all artists associated to listings that have a status of 'For Sale', orders them alphabetically
    def self.currently_listed
        Artist.includes(:listings).where(listings: { status: ["For Sale"] }).order(name: :asc)
    end

end
