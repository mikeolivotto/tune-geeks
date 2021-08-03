class OrdersController < ApplicationController
  before_action :set_listing, only: %i[ new ]
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    Listing.find(order_params[:listing_id]).status = "sold"

    respond_to do |format|
      if @order.save
        format.html { redirect_to listing_path(@order.listing_id), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def order_params
    # Artist needs to be created in the Artist model first, so the artist NAME is sent as a parameter, not artist ID
    params.permit(:listing_id, :buyer_id )
  end

end
