class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    # save the data from the form in a pet instance
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
      redirect_to user_pets_path(current_user)
    else
      render :new
    end
  end


  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end


  def edit
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end



  private
  def pet_params
    params.require(:pet).permit(:name, :age, :personality, :location, :gender, :species, :child_friendly, :guidelines)
  end



end
