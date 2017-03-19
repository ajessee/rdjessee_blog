class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :imageable, polymorphic: true
end
