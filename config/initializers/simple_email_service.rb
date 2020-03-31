# if Rails.env.production?
#   aws_credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
#   Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: aws_credentials, region: ENV['AWS_REGION'])
# end