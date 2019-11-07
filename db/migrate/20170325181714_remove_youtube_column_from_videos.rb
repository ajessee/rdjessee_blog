class RemoveYoutubeColumnFromVideos < ActiveRecord::Migration[5.2]
  def change
    remove_column :videos, :youtube, :string
    remove_column :videos, :boolean, :string
    add_column :videos, :youtube, :boolean
  end
end
