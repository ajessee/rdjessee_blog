if Rails.env.production?
  aws_credentials = Aws::Credentials.new(ENV['S3_ACCESS_KEY'], ENV['S3_SECRET_KEY'])
  Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: aws_credentials, region: ENV['AWS_REGION'])
end