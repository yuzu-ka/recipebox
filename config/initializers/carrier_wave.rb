CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :region                => ENV['S3_REGION'],    
    :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET_KEY']
  }
    
  case Rails.env
  when 'production'
      config.fog_directory  = 'specialrecipebox'
      config.asset_host = 'https://s3.amazonaws.com/specialrecipebox'
  end
end