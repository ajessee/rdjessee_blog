class AddColumnsToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :path, :string
    add_column :stories, :content_type, :string
    add_column :stories, :file_name, :string
  end
end
