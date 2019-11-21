class PetsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @pets = policy_scope(Pet).where(user: @user)
    else
      @pets = policy_scope(Pet).order(created_at: :desc)
      @pets = Pet.where(user: @user)
      @pets_location = Pet.geocoded
      @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
      end
      @pets = Pet.all
      @pets_location = Pet.geocoded
      @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end

  def users_list
    @pets = Pet.all
    @users = []
    @pets.each do |pet|
      user = User.find(pet.user_id)
      if @users.include? user == false
      else
        @users << user
      end
    end

  # def specific_user_pets_list
  #   @user = User.find(params[:user_id])
  #   @pets = Pet.where(user: @user)

  # end
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet = Pet.geocoded.find(params[:id])
    @markers =
      [{
        lat: @pet.latitude,
        lng: @pet.longitude
      }]
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    # save the data from the form in a pet instance
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    authorize @pet
    if @pet.save
      redirect_to user_pets_path(current_user)
    else
      render :new
    end
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :personality, :location, :gender, :species, :child_friendly, :guidelines, photos: [])
  end
end
