class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path, notice: 'Person was successfuly created.'
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
      redirect_to people_path, notice: 'Person was successfuly updated.'
    else
      render :edit
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :nin)
    end
end
