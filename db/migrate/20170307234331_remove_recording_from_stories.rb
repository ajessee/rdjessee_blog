class RemoveRecordingFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :recording?, :boolean
    remove_column :stories, :category, :string
  end
end
