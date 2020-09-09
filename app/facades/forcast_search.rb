class ForcastSearch
  def get_forcast(destination)
    forcast_data = forcast_service.get_forcast(destination)
    Forcast.new(forcast_data)
  end

  def forcast_service
    ForcastService.new
  end
end
