class Recording < ApplicationRecord
  belongs_to :recorder, class_name: 'User', foreign_key: :user_id
  belongs_to :recordable, polymorphic: true
  has_one_attached :audio_file
  after_commit :process_audio!

  def process_audio!
    if audio_file.attached? && audio_file.blob.content_type != 'audio/mp4'

      orig_audio_tmpfile = self.attachment_changes['audio_file'].attachable.path.to_s
      mp4_audio_tmpfile = "#{Rails.root}/tmp/#{audio_file.blob.key}_#{audio_file.blob.filename.base}.m4a"

      system("ffmpeg -i #{orig_audio_tmpfile} -c:a aac -b:a 192k #{mp4_audio_tmpfile}")
  
      self.audio_file.attach(
        io: File.open(mp4_audio_tmpfile),
        filename: "#{audio_file.blob.filename.base}.m4a",
        content_type: 'audio/mp4'
      )
  
      File.delete(mp4_audio_tmpfile)
    end
  end

end
