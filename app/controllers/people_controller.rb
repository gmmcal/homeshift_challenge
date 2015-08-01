class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person), notice: 'Person was successfuly created.'
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to person_path(@person), notice: 'Person was successfuly updated.'
    else
      render :edit
    end
  end

  def vacate
    @person = Person.find(params[:id])
    @person.house = nil
    @person.save

    redirect_to person_path(@person), notice: 'Person was successfuly updated.'
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path, notice: 'Person was successfuly destroyed.'
  end

  private
    def person_params
      params.require(:person).permit(:name, :nin)
    end
end
