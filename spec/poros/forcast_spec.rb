require 'rails_helper'

RSpec.describe 'Forcast Poro' do
  it "can create a Forcast object" do
    data = {
      :coord=>{:lon=>24.91, :lat=>50.23},
      :weather=>
      [{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
      :base=>"stations",
      :main=>
      {:temp=>55,
        :feels_like=>51.73,
        :temp_min=>55,
        :temp_max=>55,
        :pressure=>749,
        :humidity=>97},
        :visibility=>10000,
        :wind=>{:speed=>8.1, :deg=>252},
        :clouds=>{:all=>2},
        :dt=>1599623476,
        :sys=>
        {:type=>3,
          :id=>2011559,
          :country=>"UA",
          :sunrise=>1599623254,
          :sunset=>1599670080},
          :timezone=>10800,
          :id=>703716,
          :name=>"Lutsk",
          :cod=>200
      }

    forcast = Forcast.new(data)
    expect(forcast).to be_a(Forcast)
    expect(forcast.forcast_date).to eq(Time.at(data[:dt]).strftime("%A, %m/%d"))
    expect(forcast.current_temperature).to eq(data[:main][:temp])
    expect(forcast.min_temp).to eq(data[:main][:temp_min])
    expect(forcast.max_temp).to eq(data[:main][:temp_max])
    expect(forcast.description).to eq(data[:weather][0][:description])
  end
end
