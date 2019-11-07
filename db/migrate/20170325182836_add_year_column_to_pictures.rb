class AddYearColumnToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :year, :integer
  end
end
