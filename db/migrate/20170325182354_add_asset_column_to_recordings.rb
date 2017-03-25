class AddAssetColumnToRecordings < ActiveRecord::Migration
  def change
    add_attachment :recordings, :asset
  end
end
