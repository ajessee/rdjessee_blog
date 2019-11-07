class RemoveRecordingFromStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :recording?, :boolean
    remove_column :stories, :category, :string
  end
end
