class MigratePostContentToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :stories, :content, :content_old
    rename_column :stories, :title, :title_old
    add_column :stories, :content_searchable, :text
    add_column :stories, :title_searchable, :text
    Story.all.each do |story|
      story.replace_breaks
      story.update_attribute(:content, simple_format(story.content_old))
      story.update_attribute(:title, story.title_old)
      story.update_attribute(:content_searchable, story.content.to_plain_text)
      story.update_attribute(:title_searchable, story.title.to_plain_text)
    end
    remove_column :stories, :content_old
    remove_column :stories, :title_old
  end
end