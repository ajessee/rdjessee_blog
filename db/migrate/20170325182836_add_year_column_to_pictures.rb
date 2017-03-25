class AddYearColumnToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :year, :integer
  end
end
