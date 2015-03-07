class Api::V1::SongsController < ApplicationController

  def index
    $callbacks = Spotify::SessionCallbacks.new({
      connectionstate_updated: proc do |session|
        puts "New connection state: #{Spotify.session_connectionstate(session)}."
      end,
      music_delivery: proc do |session, format, frames, num_frames|
        puts "More audio coming through!"
      end,
      })

      config = {
        api_version: Spotify::API_VERSION.to_i,
        application_key: File.binread("/Users/jess/spotify_appkey.key"),
        cache_location: "",
        user_agent: "spotify for ruby",
        callbacks: $callbacks,
      }

      error, session = Spotify.session_create(config)
      raise Spotify::APIError.new(error) if error
    end

end
