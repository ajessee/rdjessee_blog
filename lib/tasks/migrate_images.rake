# frozen_string_literal: true

# To run: rake db:migrate_picture
# lib/tasks/migrate_picture.rake

task :migrate_picture => :environment do
    # def migrate_attachment!(klass:, attachment_attribute:, carrierwave_uploader:, active_storage_column: attachment_attribute)
    #     klass.find_each do |item|
    #         next unless item.send(attachment_attribute).present?
    #         attachment = item.send(attachment_attribute)
    #         attachment.cache_stored_file!
    #         file = attachment.sanitized_file.file
    #         content_type = item.send(attachment_attribute).content_type
    #         item.send(active_storage_column).attach(io: file, content_type: content_type, filename: item.attributes[attachment_attribute.to_s])
    #         item.save
    #     end
    # end

    s3 = Aws::S3::Client.new(
        region: 'us-east-1',
        access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
        Rails.application.credentials.dig(:aws, :secret_access_key)
      )

    # def migrate_attachment!(klass:, attachment_attribute:, carrierwave_uploader:, active_storage_column: attachment_attribute)
    #     klass.find_each do |item|
    #         next unless item.send(attachment_attribute).present?
    #         attachment = item.send(attachment_attribute)
    #         item.path = attachment.path
    #         item.content_type = attachment.content_type
    #         item.file_name = attachment.file.filename
    #         item.save
    #     end
    # end

    def migrate_attachment!(klass:, attachment_attribute:, carrierwave_uploader:, active_storage_column: attachment_attribute)
        klass.find_each do |item|
            next unless item.send(attachment_attribute).present?
            resp = s3.get_object(bucket: Rails.application.credentials.dig(:aws, :bucket), key: item.path)
            attach_params = {
                io: resp.body,
                file_name: item.file_name,
                content_type: item.content_type
              }
            item.picture.attach(attach_params)
            item.save
        end
    end

    puts 'Starting migration'
    migrate_attachment!(klass: Story, attachment_attribute: :thumbnail, carrierwave_uploader: PictureUploader, active_storage_column: :picture)
    migrate_attachment!(klass: Picture, attachment_attribute: :url, carrierwave_uploader: PictureUploader, active_storage_column: :picture)
    puts 'Done'

end