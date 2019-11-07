class AddAssetColumnToVideos < ActiveRecord::Migration[5.2]
  def change
    add_attachment :videos, :asset
  end
end
