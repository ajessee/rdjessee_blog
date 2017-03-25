class RemoveYoutubeColumnFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :youtube, :string
    remove_column :videos, :boolean, :string
    add_column :videos, :youtube, :boolean
  end
end
