# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.1"
gem "hanami-assets", "~> 2.1"
gem "hanami-controller", "~> 2.1"
gem "hanami-router", "~> 2.1"
gem "hanami-validations", "~> 2.1"
gem "hanami-view", "~> 2.1"

gem "i18n", "~>1.14"
gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "puma"
gem "rake"

gem "rodauth", "~> 2.26"
gem "bcrypt", "~> 3.1"
gem "mail", "~> 2.8"
gem "tilt", "~> 2.0"
gem "erubi", "~> 1.13"
gem "haml"

gem "sequel", "~>5.82"
gem "sequel_postgresql_triggers", "~> 1.6"
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"
gem "pg"

group :development do
  gem "hanami-webconsole", "~> 2.1"
  gem "guard-puma"
end

group :development, :test do
  gem "dotenv"
end

group :cli, :development do
  gem "hanami-reloader", "~> 2.1"
end

group :cli, :development, :test do
  gem "hanami-rspec", "~> 2.1"
end

group :test do
  gem "capybara"
  gem "rack-test"
  gem "database_cleaner-sequel"
end
