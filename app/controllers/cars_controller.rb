class CarsController < ApplicationController  
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :car_finder_chatbot

  def index
    @featured_cars = Car.featured_cars.to_json
  end

  def car_finder_chatbot
    search_query = params["searchTerm"] || ''
    return render json: [] if search_query == ''
    cars = Car.search_by_all(search_query)
    render json: cars
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.fetch(:car, {})
    end
end
