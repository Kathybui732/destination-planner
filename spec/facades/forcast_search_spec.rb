require 'rails_helper'

RSpec.describe 'Forcast Search' do
  it "can create forcast objects" do
    denver = Destination.create!(name: 'Denver', zip: '80207', description: 'The best city', image_url: 'https://placehold.it/300x300.png')

    result = ForcastSearch.new.get_forcast(denver)
    expect(result).to be_a(Forcast)
  end
end
