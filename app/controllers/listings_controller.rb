class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :sign_in_required, only: %i[ create new edit update destroy ]
  before_action :authorise_listing_actions, only: %i[ edit update destroy ]
  # before_action :no_empty_field, only: %i[ create ]
  before_action :check_artist_exists, only: %i[ create update ]


  # GET /listings or /listings.json
  def index
    # @listings = Listing.all

    # Select all listings for the given search (as defined in the model)
    @listings = Listing.search(params[:query])

    # Eager load all listings with a "For Sale" status
    @listings_for_sale = @listings.where(status: "For Sale").eager_load(:artist)

    # Call the artist_in_db method from the model
    @artist_in_db = Listing.artist_in_db(params[:query])

  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    
    # Pass in all parameters to a new listing, except artist name - replace that with the artist id 
    @listing = Listing.new(listing_params.except(:artist))
    # Set the artist id
    @listing.artist_id = @artist_id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update

    # Pass in all parameters to a new listing, except artist name - replace that with the artist id 
    listing_update_params = listing_params.except(:artist)
    # Set the artist id
    listing_update_params[:artist_id] = @artist_id

    
    respond_to do |format|
      if @listing.update(listing_update_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def listing_params
      # Artist needs to be created in the Artist model first, so the artist NAME is sent as a parameter, not artist ID
      params.require(:listing).permit(:name, :artist, :price, :description, :status, :seller_id, :images )
    end

    # Check if the current logged in user is the seller. If not, redirect and alert them
    def authorise_listing_actions
      if (current_user.profile.id != @listing.seller.id)
        redirect_to root_path, alert: "You are not authorised to perform that action."
      end
    end
  
    # Method to check if artist exists, add to Artist model if not. In either case, set variable for the new (or existing) artist ID
    def check_artist_exists
      if listing_params[:artist] == ""
        listing_params[:artist] = nil
        return
      end

      # If the artist does not exist in the db, create a new artist record
      if !Artist.find_by(name: listing_params[:artist].downcase).present?
        Artist.create(name: listing_params[:artist].downcase)
      end  
      # Get the artist id and name
      artist = Artist.find_by(name: listing_params[:artist].downcase)
      @artist_id = artist.id
      @artist_name = artist.name
    end


end


  