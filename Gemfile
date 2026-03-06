source "https://rubygems.org"

# 認証
gem 'devise'

# Rails 本体
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "sprockets-rails"

# データベース
# 本番用 PostgreSQL（全環境で読み込む）
gem "pg", "~> 1.5"

# SQLite はローカル開発用
group :development, :test do
  gem "sqlite3", ">= 1.4"
end

# Web サーバー
gem "puma", ">= 5.0"

# フロントエンド関連
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# API/JSON
gem "jbuilder"

# 認証・セキュリティ
gem "bcrypt", "~> 3.1.7"

# タイムゾーン対応（Windows用）
gem "tzinfo-data", platforms: %i[windows jruby]

# 起動高速化
gem "bootsnap", require: false

# 開発環境専用
group :development do
  gem "web-console"
end

# 開発・テスト共通
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

# テスト専用
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end