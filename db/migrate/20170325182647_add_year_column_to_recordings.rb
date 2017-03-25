class AddYearColumnToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :year, :integer
  end
end
