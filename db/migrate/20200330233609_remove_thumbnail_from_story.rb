class RemoveThumbnailFromStory < ActiveRecord::Migration[6.0]
  def change

    remove_column :stories, :thumbnail, :string
  end
end
