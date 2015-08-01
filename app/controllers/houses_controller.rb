class HousesController < ApplicationController
  def index
    @houses = House.available
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

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])

    if @house.update(house_params)
      redirect_to houses_path, notice: 'House was successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path, notice: 'House was successfuly destroyed.'
  end

  private
    def house_params
      params.require(:house).permit(:title, :description, :address, :postcode)
    end
end
