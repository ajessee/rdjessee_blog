class RemoveUseridagainFromComments < ActiveRecord::Migration
  def change
    remove_index(:comments, column: :user_id)
    remove_column :comments, :user_id
  end
end
