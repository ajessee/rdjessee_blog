class AddAttribitesToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :location, :string
    add_column :stories, :genre, :string
    add_column :stories, :word_count, :integer
    add_column :stories, :type, :string
    add_column :stories, :life_stage, :string
    remove_column :stories, :age, :integer
  end
end
