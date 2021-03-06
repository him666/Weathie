class Forecast
  include HTTParty
  attr_accessor(:city, :zipcode, :weather_cache)

  def initialize(params)
      @city = params[:city]
      @zipcode = params[:zip_code]
      @weather_cache = true
      @base_uri = "http://api.openweathermap.org/data/2.5/weather?"
      @apikey = ENV['WEATHER_APIKEY']
  end
  
  def get_forecast_by_city
    uri = "#{@base_uri}q=#{@city}&appid=#{@apikey}"
    get_forecast(uri)
  end

  def get_forecast_by_zip(zipcode)
    uri = "#{@base_uri}zip=#{@zipcode},us&appid=#{@apikey}"
    get_forecast(uri)
  end

  def cache_forecast(zipcode)
    Rails.cache.fetch("#{zipcode}", expires_in: 30.minutes) do
      @weather_cache = false
      get_forecast_by_city
    end
  end

  def get_forecast(uri)
    puts uri
    response = HTTParty.get("#{@base_uri}q=#{@city}&appid=#{@apikey}&units=imperial", format: :plain)
    JSON.parse response, symbolize_names: true
  end

end