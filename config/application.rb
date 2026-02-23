require_relative "boot"

require "rails/all"   # ← これが必要

Bundler.require(*Rails.groups)

module StayApp
  class Application < Rails::Application
    config.load_defaults 7.2

    # ここに追加
    config.i18n.default_locale = :ja

    config.autoload_lib(ignore: %w[assets tasks])
  end
end
