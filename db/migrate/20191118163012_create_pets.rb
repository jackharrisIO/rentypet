class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :personality
      t.string :location
      t.string :gender
      t.string :temprament
      t.boolean :child_friendly
      t.string :guidelines
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
