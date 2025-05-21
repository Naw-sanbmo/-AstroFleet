class ChangeTotalPriceToBigintInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :total_price, :bigint
  end
end
