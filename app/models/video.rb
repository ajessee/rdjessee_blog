class Video < ApplicationRecord
  belongs_to :uploader, class_name: 'User', foreign_key: :user_id
  belongs_to :videoable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings
  mount_uploader :video, VideoUploader

  def set_success(format, opts)
    self.success = true
  end
  
end
