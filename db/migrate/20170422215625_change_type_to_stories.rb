class ChangeTypeToStories < ActiveRecord::Migration
  def change
    remove_column :stories, :type, :string
    add_column :stories, :category, :string
  end
end
