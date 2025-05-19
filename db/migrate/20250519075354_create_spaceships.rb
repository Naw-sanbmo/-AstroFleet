class CreateSpaceships < ActiveRecord::Migration[7.1]
  def change
    create_table :spaceships do |t|

      t.timestamps
    end
  end
end
