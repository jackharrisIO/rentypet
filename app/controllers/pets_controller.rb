class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @pets = Pet.where(user: @user)
    else
      @pets = Pet.where(user: @user)
      # @pets_location = Pet.geocoded
      # @markers = @pets.map do |pet| {
      #   lat: pet.latitude,
      #   lng: pet.longitude
      # }
      end

      if params[:query].present?
        @pets = Pet.where("species ILIKE ?", "%#{params[:query]}%")
      else
        @pets = Pet.all
      end
      # @pets_location = Pet.geocoded
      # @markers = @pets.map do |pet| {
      #   lat: pet.latitude,
      #   lng: pet.longitude
      # }
      # end
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


  end

  def show

    @pet = Pet.find(params[:id])
    @pet = Pet.geocoded.find(params[:id])

    @booking = Booking.new
    @markers =
      [{
        lat: @pet.latitude,
        lng: @pet.longitude
      }]

  end

  def new
    @pet = Pet.new
  end

  def create
    # save the data from the form in a pet instance
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.available = true

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
