class AddAssetColumnToVideos < ActiveRecord::Migration
  def change
    add_attachment :videos, :asset
  end
end
