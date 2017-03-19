class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_many :comments, as: :commentable
  mount_uploader :url, MainPictureUploader

  def strip_divs
    self.caption = self.caption[5..-7]
  end

end
