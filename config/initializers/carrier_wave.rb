CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_KEY'],
    region: ENV['S3_REGION']
    }
    
    # 公開・非公開の切り替え
    config.fog_public = true
    # 日本語ファイル名の設定
    CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

    case Rails.env
    when 'development'
        config.fog_directory  = ENV['S3_BUCKET']
        config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/specialrecipebox'
    when 'production'
        config.fog_directory  = ENV['S3_BUCKET']
        config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/specialrecipebox'
    end
end