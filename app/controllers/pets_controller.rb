class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new

  end

  def create
    @pet = Pet.new(pet_params)

    @pet.save
    redirect_to @pet
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:kind, :name, :age, :description, :vaccinated, :sterilized, :location)
  end
end
