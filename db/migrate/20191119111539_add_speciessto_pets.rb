class AddSpeciesstoPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :species, :string, null: false
  end
end
