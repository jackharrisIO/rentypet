class PetsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @pets = Pet.where(user: @user)
      @pets_location = Pet.geocoded
      @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
    else
      @pets = Pet.all
      @pets_location = Pet.geocoded
      @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
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
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end


  def edit
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end



  private
  def pet_params
    params.require(:pet).permit(:name, :age, :personality, :location, :gender, :species, :child_friendly, :guidelines, photos: [])
  end



end
