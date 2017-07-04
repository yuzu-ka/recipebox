CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_KEY'],
    region: "ap-northeast-1"
    }

    case Rails.env
    when 'development'
        config.fog_directory  = 'specialrecipebox'
        config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/specialrecipebox'
    when 'production'
        config.fog_directory  = 'specialrecipebox'
        config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/specialrecipebox'
    end
end