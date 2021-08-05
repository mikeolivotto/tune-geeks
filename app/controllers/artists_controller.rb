class ArtistsController < ApplicationController

    before_action :set_artist, only: %i[ show ]
    before_action :available_items, only: %i[ show ]
    before_action :sold_items, only: %i[ show ]

    def index
    end

    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def available_items
      @available_items = Listing.where(artist_id: @artist.id).where(status: "For Sale")
    end

    def sold_items
      @sold_items = Listing.where(artist_id: @artist.id).where(status: "Sold")
    end

    

end


