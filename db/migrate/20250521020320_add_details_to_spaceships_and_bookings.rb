class AddDetailsToSpaceshipsAndBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :spaceships, :description, :text
    add_column :spaceships, :rating, :integer

    add_column :bookings, :status, :string
  end
end
