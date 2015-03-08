class WeathersController < ApplicationController
  protect_from_forgery with: :exception

  def index
  end

  def show
    weather = Weather.new.current_weather(params[:state_code], params[:city])
    render json: weather
  end





end
