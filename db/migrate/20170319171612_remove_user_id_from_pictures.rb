class RemoveUserIdFromPictures < ActiveRecord::Migration
  def up
    add_reference(:pictures, :imageable, polymorphic: true, index: true)
  end

  def down
    remove_index(pictures, column: user_id)
    remove_column :pictures, :user_id
  end
end
