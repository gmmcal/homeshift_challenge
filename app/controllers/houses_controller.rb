class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      redirect_to houses_path, notice: 'House was successfuly created.'
    else
      render :new
    end
  end

  private
    def house_params
      params.require(:house).permit(:title, :description, :address, :postcode)
    end
end
