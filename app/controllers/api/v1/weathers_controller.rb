class Api::V1::WeathersController < ApplicationController
  protect_from_forgery with: :exception


  def index
    @weather = Weather.new(params[:city], params[:state])

    # hurricane_url = "http://api.wunderground.com/api/61823ef325ea2b77/currenthurricane/view.json"
    # @hurricane_count = HTTParty.get(hurricane_url)["currenthurricane"].length
  end







end
