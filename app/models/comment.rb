class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :imageable, polymorphic: true
  default_scope -> { order(created_at: :desc) }

  def strip_divs
    self.content = self.content[5..-7]
  end
end
