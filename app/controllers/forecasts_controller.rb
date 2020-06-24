class ForecastsController < ApplicationController
  def index
    
    
  end

  def show
    puts "this is the life #{params[:city]}"
    @forecast = Forecast.new(params)
    puts @forecast.city
    @forecast_response = @forecast.cache_forecast(params[:zip_code])
    @forecast_response.inspect
  end

end
