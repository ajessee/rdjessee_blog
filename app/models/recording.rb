class Recording < ApplicationRecord
  belongs_to :recorder, class_name: 'User', foreign_key: :user_id
  belongs_to :recordable, polymorphic: true
  has_one_attached :audio_file

  def convert_to_mp4
end
