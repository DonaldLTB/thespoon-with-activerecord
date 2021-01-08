class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  # will call the action find_restaurant at the given methods
  def index # all restaurants
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # no need to create.html.erb
    redirect_to restaurant_path(@restaurant) # by default @restaurant is the id. if you want user do sth. like @restaurant.user_name
  end

  def edit; end

  def update
    @restaurant.update(restaurant_params)
    # no need to update.html.erb
    redirect_to restaurant_path(@restaurant) # path is dynamic so needs value
  end

  def destroy
    @restaurant.destroy
    # no need to destroy.html.erb
    redirect_to restaurants_path # no dynamic value
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
