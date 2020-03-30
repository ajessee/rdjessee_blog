class AddColumnsToPicture < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :path, :string
    add_column :pictures, :content_type, :string
    add_column :pictures, :file_name, :string
  end
end
