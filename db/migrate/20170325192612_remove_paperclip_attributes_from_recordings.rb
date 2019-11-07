class RemovePaperclipAttributesFromRecordings < ActiveRecord::Migration[5.2]
  def change
    remove_column :recordings, :asset_file_name, :string
    remove_column :recordings, :asset_content_type, :string
    remove_column :recordings, :asset_file_size, :integer
    remove_column :recordings, :asset_updated_at, :datetime
    add_column :recordings, :recording, :string
  end
end
