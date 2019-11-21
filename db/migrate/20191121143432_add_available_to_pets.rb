class AddAvailableToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :available, :boolean
  end
end
