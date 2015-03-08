class Weather

  def initialize
  end

  def current_weather(state_code, city)
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_TOKEN']}/conditions/q/#{state_code}/#{city}.json")
    sports_baby
  end


  def sports_baby
    date
    @sport = HTTParty.get("https://api.sportsdatallc.org/ncaamb-t3/games/#{@date}/schedule.xml?api_key=#{ENV['SPORTS_TOKEN']
    }")
  end

  def date
    d = Time.now
    @date = d.strftime("%Y/%m/%d")
  end


  # def location_name
  #   @data["current_observation"]["display_location"]["full"]
  # end

  # http://api.sportsdatallc.org/ncaamb-t3/games/2014/reg/schedule.xml?api_key=2rafzs7jut24a5za5h2sp5ya

end
