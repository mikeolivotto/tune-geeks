class Artist < ApplicationRecord
    has_many :listings


    def self.random
        Artist.pluck(:name).sample(1)[0].titlecase
    end
end
