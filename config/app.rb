# frozen_string_literal: true

# rubocop:disable all
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require "./config/env"
require "logger"
require "roda"
require "strum/service"
require "strum/pipe"
require "strum/json"
require "active_support"
require "fast_jsonapi"
require "config/constants"
require "strum/esb"

unless defined?(Unreloader)
  require "rack/unreloader"
  Unreloader = Rack::Unreloader.new(reload: false)
end

Unreloader.require("services")
Unreloader.require("entities")
Unreloader.require("controllers")
Unreloader.require("serializers")
Unreloader.require("proto")
Unreloader.require("build")

Strum::Esb.config.info_exchange = "qiwa.info"
Strum::Esb.config.event_exchange = "qiwa.events"
Strum::Esb.config.action_exchange = "qiwa.actions"
Strum::Esb.config.notice_exchange = "qiwa.notice"

# API entry point
class EmployeeDetailsApp < Roda
  opts[:root] = ENV["STRUM_ROOT"]
  plugin :json, content_type: "application/vnd.api+json"
  plugin :json_parser
  plugin :all_verbs
  plugin :symbol_status
  plugin :slash_path_empty

  plugin :hash_routes
  Unreloader.require("routes")

  logger = if ENV["RACK_ENV"] == "test"
      Class.new do
        def write(___); end
      end.new
    else
      $stderr
    end
  plugin :common_logger, logger

  route do |req|
    session # load session always
    I18n.locale = session[:language] || ::Constants::DEFAULT_LANGUAGE
    req.hash_routes
  end
end
