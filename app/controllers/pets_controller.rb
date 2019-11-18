class PetsController < ApplicationController

  def index
    @pets = Pets.all
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
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
  end


  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end


  def edit
    @rpet = Pet.find(params[:id])
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end



  private
  def task_params
    params.require(:pet).permit(:name, :age, :personality, :location, :gender, :gender, :child_friendly, :guidelines)
  end



end
