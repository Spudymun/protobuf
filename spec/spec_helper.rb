# frozen_string_literal: true

ENV["RACK_ENV"] ||= "test"

require "./config/env"
require "pry"
require "support/allure"
require "support/bunny_mock"
require "support/json_request"
require "support/vcr"
require "mock_redis"
require "redis-objects"
require "httparty"

Redis::Objects.redis = MockRedis.new

RSpec::Matchers.define_negated_matcher :not_change, :change

RSpec.configure do |config|
  config.add_formatter AllureRspecFormatter
  config.add_formatter "documentation"
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.after do
    Redis::Objects.redis.flushall
  end

  config.filter_run_when_matching :focus

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  config.warnings = false

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
