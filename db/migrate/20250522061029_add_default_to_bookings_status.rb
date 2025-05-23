class AddDefaultToBookingsStatus < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, 0
    change_column_null :bookings, :status, false
  end
end
