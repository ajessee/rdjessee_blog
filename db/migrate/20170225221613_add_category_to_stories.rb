class AddCategoryToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :category, :string
  end
end
