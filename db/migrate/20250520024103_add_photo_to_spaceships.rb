class AddPhotoToSpaceships < ActiveRecord::Migration[7.1]
  def change
    add_column :spaceships, :photo, :string
  end
end
