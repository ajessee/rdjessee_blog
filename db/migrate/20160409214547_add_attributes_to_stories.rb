class AddAttributesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :year_written, :integer
    add_column :stories, :decade, :integer
    add_column :stories, :age, :integer
    add_column :stories, :recording?, :boolean, default: false
  end
end
