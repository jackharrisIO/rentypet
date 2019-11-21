class AddEndingdateToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :endingdate, :date
  end
end
