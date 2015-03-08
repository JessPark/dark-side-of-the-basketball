class Weather

  def initialize
  end

  def current_weather(state_code, city)
    @city = city
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_TOKEN']}/conditions/q/#{state_code}/#{city}.json")
    sports_baby
  end


  def sports_baby
    date
    @sport = HTTParty.get("https://api.sportsdatallc.org/ncaamb-t3/games/#{@date}/schedule.xml?api_key=#{ENV['SPORTS_TOKEN']
    }")
    venues = @sport["league"]["daily_schedule"]["games"]["game"]
    cities = []
    if venues.each do |v|
      if v["venue"]["city"].downcase == @city.downcase.gsub( "_", " ")
        cities << v
      end
    end
  end
  weather_sport = {}
  weather_sport[:weather] = @weather["current_observation"]["weather"]
  weather_sport[:venues] = cities





  return weather_sport

  end

  def date
    d = Time.now
    @date = d.strftime("%Y/%m/%d")
  end






end
