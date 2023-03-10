class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[ edit update destroy ]

  # GET /cars
  def index
    @cars = Car.all
  end

  # GET /cars/1
  def show
    @cars = GarageService.new(verb: "get").call(garage: params[:id])
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    @car.owner = current_user.username

    if @car.save
      # GarageJob.perform_later(verb: "post", car: @car)
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    redirect_to cars_url, notice: "Car was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:brand, :model, :owner, :plate, :garage)
    end
end
