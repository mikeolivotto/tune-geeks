class HomeController < ApplicationController
  before_action :feature_listings
  
  def page


  end


  private

  def feature_listings
      @featured = Listing.find(Listing.pluck(:id).sample(3))
  end


end
