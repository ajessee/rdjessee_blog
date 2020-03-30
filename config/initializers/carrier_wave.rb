if Rails.env.production? 
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = Rails.application.credentials.dig(:aws, :bucket)
    config.aws_acl    = 'public-read'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),                        # required unless using use_iam_profile
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),                        # required unless using use_iam_profile
      region:                Rails.application.credentials.dig(:aws, :region),                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory = Rails.application.credentials.dig(:aws, :bucket)

    # Optionally define an asset host for configurations that are fronted by a
    # content host, such as CloudFront.
    # config.asset_host = 'http://example.com'

    # The maximum period for authenticated_urls is only 7 days.
    # config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    # Set custom options such as cache control to leverage browser caching
    # config.aws_attributes = {
      # expires: 1.week.from_now.httpdate,
      # cache_control: 'max-age=604800'
    # }

    config.aws_credentials = {
      access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
      secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region:            Rails.application.credentials.dig(:aws, :region) # Required
    }

    # Optional: Signing of download urls, e.g. for serving private content through
    # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
    # configured:
    # config.aws_signer = -> (unsigned_url, options) do
    #   Aws::CF::Signer.sign_url(unsigned_url, options)
    # end
  end
end