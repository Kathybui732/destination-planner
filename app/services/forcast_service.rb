class ForcastService
  def get_forcast(destination)
    response = conn.get '/data/2.5/weather' do |req|
      req.params['q'] = destination.name
      req.params['q'] = destination.zip
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new 'https://api.openweathermap.org' do |f|
      f.params['units'] = 'imperial'
      f.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
  end
end
