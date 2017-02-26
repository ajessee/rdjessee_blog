class AddThumbnailPictureToStories < ActiveRecord::Migration
  def change
    add_column :stories, :thumbnail, :string
  end
end
