CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    # aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    # aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    aws_access_key_id: 'AKIAJVE7UYLEHIJZIYUQ',
    aws_secret_access_key: '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'
  }
  # config.fog_directory = ENV["AWS_S3_BUCKET"]
  config.fog_directory = 'myvoicekc'
end
