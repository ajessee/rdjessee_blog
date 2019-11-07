class AddVideoableAttributesToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :videoable_id, :integer
    add_column :videos, :videoable_type, :string
  end
end
