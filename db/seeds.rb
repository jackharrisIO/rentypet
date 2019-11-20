# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
User.destroy_all



john = User.create!(last_name: "who", first_name: "cares",email: "john@test.com", password: "123456")
casper = User.create!(last_name: "who", first_name: "cares",email: "casper@test.com", password: "123456")
billy = User.create!(last_name: "who", first_name: "cares",email: "billy@test.com", password: "123456")
shelia = User.create!(last_name: "who", first_name: "cares",email: "shelia@test.com", password: "123456")
betty = User.create!(last_name: "who", first_name: "cares",email: "betty@test.com", password: "123456")



# create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end


puts 'Creating 10 fake pets'
10.times do
  pet = Pet.new(
    name:  Faker::FunnyName.name,
    age: rand(0..15),
    personality: rand(0..5),
    location: Faker::Address.postcode, #=> "76032-4907" or "58517"
    gender: Faker::Gender.binary_type.downcase, #=> "Female"
    temperament: ['Friendly', 'Calm', 'Naughty', 'Playful'].sample,
    child_friendly: true,
    guidelines: ['walk', 'feed', 'play'].sample,
    species: ['dog', 'cat', 'reptile','fish'].sample,
    user: User.all.sample
  )
  pet.save!
end
puts 'Finished!'
