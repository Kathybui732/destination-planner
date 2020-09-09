class Destination < ApplicationRecord
  def forcast
    ForcastSearch.new.get_forcast(self)
  end
end
