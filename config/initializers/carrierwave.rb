CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['fog_api_key'],
    aws_secret_access_key: ENV['fog_api_secret'],
    region: ENV['fog_region'],
    host: ENV['fog_host'],
  }
  config.cache_storage = :fog
  config.cache_dir = 'tmp/image-cache'
  config.fog_directory = ENV['fog_directory']
  config.asset_host = ENV['fog_asset_host']
end