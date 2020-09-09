class Forcast
  attr_reader :forcast_date,
              :current_temperature,
              :min_temp,
              :max_temp,
              :description

  def initialize(forcast_data)
    @forcast_date = Time.at(forcast_data[:dt]).strftime("%A, %m/%d")
    @current_temperature = forcast_data[:main][:temp]
    @min_temp = forcast_data[:main][:temp_min]
    @max_temp = forcast_data[:main][:temp_max]
    @description = forcast_data[:weather][0][:description]
  end
end
