require 'aws-sdk'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))
})

Aws.config[:credentials] = Aws::Credentials.new(Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))