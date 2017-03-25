class Recording < ActiveRecord::Base
  belongs_to :uploader, class_name: 'User', foreign_key: :user_id
  belongs_to :recordable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings
end
