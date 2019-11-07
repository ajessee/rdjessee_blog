class AddThumbnailPictureToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :thumbnail, :string
  end
end
