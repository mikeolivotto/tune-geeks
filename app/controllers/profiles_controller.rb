class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :sign_in_required, only: %i[ create new edit update destroy ]
  before_action :authorise_profile_actions, only: %i[ edit update destroy ]
  skip_before_action :username

  # GET /profiles or /profiles.json
  def index
    redirect_to root_path
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    @current_listings = Listing.where(seller: @profile.id).where(status: "For Sale").eager_load(:artist)
    @sold = Listing.where(seller: @profile.id).where(status: "Sold").eager_load(:artist, :order)
    @bought = Order.where(buyer_id: @profile.id).includes(:listing)
  end

  # GET /profiles/new
  def new
    if current_user.profile.present? == false
      @profile = Profile.new
    else
      redirect_to profile_path(current_user.profile.id)
    end
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:username, :first_name, :last_name, :avatar, :user_id)
    end

    def authorise_profile_actions
      if (current_user.profile.id != @profile.id)
        redirect_to root_path, alert: "You are not authorised to perform that action."
      end
    end
end
