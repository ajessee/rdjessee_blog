class AddVideoableAttributesToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :videoable_id, :integer
    add_column :videos, :videoable_type, :string
  end
end
