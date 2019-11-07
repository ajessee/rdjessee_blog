class RemovePaperclipAttributesFromVideos < ActiveRecord::Migration[5.2]
  def change
    remove_column :videos, :asset_file_name, :string
    remove_column :videos, :asset_content_type, :string
    remove_column :videos, :asset_file_size, :integer
    remove_column :videos, :asset_updated_at, :datetime
    add_column :videos, :video, :string
  end
end
