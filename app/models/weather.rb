class Weather

  def initialize(city, state_code="NC")
    url = "http://api.wunderground.com/api/61823ef325ea2b77/conditions/q/#{state_code}/#{city}.json"
    @data = HTTParty.get(url)
  end



end
