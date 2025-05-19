class CreateSpaceships < ActiveRecord::Migration[7.1]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.integer :price
      t.integer :max-speed
      t.references :user, null: false, foreign_key: true
      t.string :size

      t.timestamps
    end
  end
end
