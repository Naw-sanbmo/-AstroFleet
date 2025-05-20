class AddFieldsToSpaceships < ActiveRecord::Migration[7.1]
  def change
    add_column :spaceships, :name, :string
    add_column :spaceships, :price, :integer
    add_column :spaceships, :max_speed, :integer
    add_column :spaceships, :features, :text
    add_column :spaceships, :size, :string
    add_reference :spaceships, :user, null: false, foreign_key: true
  end
end
