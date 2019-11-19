class ChangeTempramentName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :temprament, :temperament
  end
end
