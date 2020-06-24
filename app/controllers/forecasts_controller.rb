class ForecastsController < ApplicationController
  def index
    
    
  end

  def show
    puts "this is the life #{params[:city]}"
    @forecast = Forecast.new(params)
    puts @forecast.city
    @forecast_response = @forecast.get_forecast_by_city
    @forecast_response.inspect
  end

end
