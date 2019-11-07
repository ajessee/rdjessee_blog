class AddAssetColumnToRecordings < ActiveRecord::Migration[5.2]
  def change
    add_attachment :recordings, :asset
  end
end
