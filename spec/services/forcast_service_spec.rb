require 'rails_helper'

RSpec.describe 'Weather service' do
  it "can call the weather service api to return data" do
    denver = Destination.create!(name: 'Denver', zip: '80207', description: 'The best city', image_url: 'https://placehold.it/300x300.png')

    data = [
      :coord,
      :weather,
      :base,
      :main,
      :visibility,
      :wind,
      :clouds,
      :dt,
      :sys,
      :timezone,
      :id,
      :name,
      :cod
    ]

    results = ForcastService.new.get_forcast(denver)
    data.each do |i|
      expect(results).to have_key(i)
    end
  end
end
