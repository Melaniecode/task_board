# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskBoard
  # represents the core application configuration and settings.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    # 這行是設定我們預設的語言，抓不到時區的話，預設都是使用 tw 的版本
    config.i18n.default_locale = :tw
    # 這個是設定，我的語言只接受這兩個參數
    I18n.available_locales = %i[tw en]
    # 這就是設定預設的時區
    config.time_zone = 'Taipei'
    # 這行是 如果沒有明確指定時區，就會從你的電腦去抓你正在使用的本地時區。
    config.active_record.default_timezone = :local
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    # config.eager_load_paths << Rails.root.join("extras")
  end
end
