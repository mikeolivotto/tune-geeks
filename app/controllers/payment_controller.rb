class PaymentController < ApplicationController
  def create
    # Fetch the listing
    @listing = Listing.find(params[:id])


    # Fetch the root path
    if ENV["RAILS_ENV"] == "development"
      root_path = "http://localhost:3000/"
      #Stripe.api_key = Rails.application.credentials.dig(:stripe, :stripe_secret_key)
    else
      root_path = ENV["ROOT_PATH"]
    end
    
    
    
    # Implement Stripe code
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'aud',
          product_data: {
            name: "#{@listing.name.titlecase} - #{@listing.artist.name.titlecase}",
          },
          unit_amount_decimal: (@listing.price)*100,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # Upon success redirect back to listing page
      success_url: "#{root_path}listings/#{@listing.id}?checkout=success",
      cancel_url: "#{root_path}listings/#{@listing.id}",
    })
  
    redirect_to session.url

  end
end
