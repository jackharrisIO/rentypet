class ChangeAvailableInPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :available, :boolean, default: true
  end
end
