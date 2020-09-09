require 'rails_helper'
require 'date'

RSpec.describe 'Current Weather' do
  describe 'As a visitor' do
    before :each do
      @denver = Destination.create!(name: 'Denver', zip: '80207', description: 'The best city', image_url: 'https://placehold.it/300x300.png')
    end

    it 'can display the weather of a location' do
      visit '/'
      within ".city-#{@denver.id}" do
        click_on 'Show'
      end
      expect(current_path).to eq("/destinations/#{@denver.id}")
      expect(page).to have_content(@denver.name)
      expect(page).to have_content(@denver.zip)
      expect(page).to have_content(@denver.description)
      expect(page).to have_content("Date: #{Time.now.strftime("%A, %m/%d")}")
      expect(page).to have_content("Current Temperature:")
      expect(page).to have_content("Today's high:")
      expect(page).to have_content("Today's low:")
      expect(page).to have_content("Weather Summary:")
    end
  end
end
