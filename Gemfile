# frozen_string_literal: true

source "https://rubygems.org"

ruby ">= 3"

# framework
gem "fast_jsonapi", "1.5"
gem "irb", "~> 1.3.7"
gem "oj", "~> 3.12"
gem "puma", "~> 5.4"
gem "rack-unreloader", "~> 1.7"
gem "rake", "~> 12.3"
gem "roda", "~> 3.32"
gem "roda-route_list", "~> 2.1"

group :strum do
  gem "strum-esb", "0.3.2"
  gem "strum-json", "~> 0.0.5"
  gem "strum-pipe", "~> 0.0.4"
  gem "strum-service", "~> 0.2.1"
end

group :development do
  # A Ruby static code analyzer and formatter,
  # based on the community Ruby style guide. https://docs.rubocop.org
  gem "rubocop", "~> 1.25", require: false
  gem "rubocop-rspec", "~> 2.4", require: false
  gem "solargraph", "~> 0.44.3"
end

group :test do
  gem "allure-rspec", "~> 2.17.0", github: "allure-framework/allure-ruby"
  gem "bunny-mock", "~> 1.7.0", github: "arempe93/bunny-mock"
  gem "httparty", "~> 0.18.1"
  gem "json_spec", "~> 1.1.5"
  gem "mock_redis", "~> 0.31.0"
  gem "redis-objects", "~> 1.5"
  gem "vcr", "~> 6.0"
  gem "webmock", "~> 3.12"
end

group :development, :test do
  gem "pry", "~> 0.14"
  gem "rspec", "~> 3.10"
  gem "rspec_junit_formatter", "~> 0.4"
  gem "ruby-debug-ide", "~> 0.7.0"

  # A Ruby gem to load environment variables from `.env`.
  gem "dotenv", "~> 2.7"
  gem "varint"
  gem "google-protobuf", "~> 3.20.1"
  gem "grpc", "~> 1.37"
  gem "grpc-tools", "~> 1.37"
end

gem "bundler", "~> 2.3.12"
