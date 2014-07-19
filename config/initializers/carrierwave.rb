if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage         = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                'ap-northeast-1',# optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['AWS_S3_BUCKET']  # Bucket
    config.fog_public     = true
    # config.fog_attributes = { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate }  # optional, defaults to {}
    # config.fog_authenticated_url_expiration = (365 * 24 * 60 * 60)  # seconds
    # config.remove_previously_stored_files_after_update = false      # 画像更新時に以前のバージョンを削除しない
    # config.asset_host = ENV['ASSET_HOST']
  end
end
