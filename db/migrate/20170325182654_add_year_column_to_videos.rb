class AddYearColumnToVideos < ActiveRecord::Migration[5.2]
  def change
        add_column :videos, :year, :integer
  end
end
