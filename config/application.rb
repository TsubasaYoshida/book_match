require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookMatch
  class Application < Rails::Application
    config.load_defaults 5.2

    # タイムゾーン指定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.generators do |g|
      # 「rails g」時の自動生成を制御
      g.assets false
      g.helper false
      g.test_framework false
    end
  end
end
