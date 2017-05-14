class Picture < ActiveRecord::Base
  belongs_to :photographer, class_name: 'User', foreign_key: :user_id
  belongs_to :imageable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings
  mount_uploader :url, PictureUploader

  def strip_divs
    self.caption.gsub!("<div>", "")
    self.caption.gsub!("</div>", "")
  end

end
