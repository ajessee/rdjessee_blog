class ChangeTypeToStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :type, :string
    add_column :stories, :category, :string
  end
end
