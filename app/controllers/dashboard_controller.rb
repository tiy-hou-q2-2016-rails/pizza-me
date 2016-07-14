class DashboardController < ApplicationController

  before_action do
    @current_location = session[:location]

    if @current_location.nil?
      redirect_to new_location_path
    end
  end

  def show


    lat = @current_location["lat"]
    lon = @current_location["lon"]
    url = "https://api.foursquare.com/v2/venues/search?query=pizza&ll=#{lat},#{lon}&client_id=XBHWSMTCE4XHNZTZ4F30QA5411KEEPBQZMSD0Q1O0NQPCYOM&client_secret=FWB3CKVBKWN0D5PNDD1YX2ODWJTX5YG51TLTZ0MDGH2OOCVG&v=20160714"

    json = JSON.parse(Http.get(url).body)

    @venues = json["response"]["venues"]
  end
end
