class ArtistsController < ApplicationController

    before_action :set_artist, only: %i[ show ]

    def index
    end

    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end
end
