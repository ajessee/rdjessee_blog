class AddYearColumnToRecordings < ActiveRecord::Migration[5.2]
  def change
    add_column :recordings, :year, :integer
  end
end
