class RemoveUseridFromComments < ActiveRecord::Migration
  def up
    add_reference(:comments, :commentable, polymorphic: true, index: true)
  end

  def down
    remove_index(:comments, column: :user_id)
    remove_column :comments, :user_id
  end
end
