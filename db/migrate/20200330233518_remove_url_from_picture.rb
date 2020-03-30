class RemoveUrlFromPicture < ActiveRecord::Migration[6.0]
  def change

    remove_column :pictures, :url, :string
  end
end
