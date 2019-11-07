class AddUseridToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference(:comments, :user, index: true, foreign_key: true)
  end
end
