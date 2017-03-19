class RemoveUseridFromPictures < ActiveRecord::Migration
  def change
    remove_index(:pictures, column: :user_id)
    remove_column :pictures, :user_id
  end
end
