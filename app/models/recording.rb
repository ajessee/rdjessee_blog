class Recording < ApplicationRecord
  # belongs_to :uploader, class_name: 'User', foreign_key: :user_id
  belongs_to :recordable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  mount_uploader :recording, RecordingUploader
end
