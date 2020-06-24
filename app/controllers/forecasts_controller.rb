class ForecastsController < ApplicationController
  def index
    
    
  end

  def show
    redirect_to root_path if params.nil? 
    @forecast = Forecast.new(params)
    @forecast_response = @forecast.cache_forecast(params[:zip_code])
    @cache_color = @forecast.weather_cache ? 'color:blue;' : 'color:black;'
  end

end
