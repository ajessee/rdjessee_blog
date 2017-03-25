class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :caption
      t.string :youtube
      t.string :boolean
      t.string :youtube_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
