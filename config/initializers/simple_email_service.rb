if Rails.env.production?
  aws_credentials = Aws::Credentials.new(Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))
  Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: aws_credentials, region: Rails.application.credentials.dig(:aws, :bucket))
end