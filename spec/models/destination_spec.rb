require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe 'methods' do
    it "#forcast" do  
      denver = Destination.create!(name: 'Denver', zip: '80207', description: 'The best city', image_url: 'https://placehold.it/300x300.png')

      expect(denver.forcast).to be_a(Forcast)
    end
  end
end
