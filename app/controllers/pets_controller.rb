class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy!
      redirect_to pets_path, :notice => "Successfully deleted a pet."
    else
      redirect_to pets_path, :notice => "Failed to delete a pet."
    end
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to @pet
    else
      render :edit
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:kind, :name, :age, :description, :vaccinated, :sterilized, :location)
  end
end
