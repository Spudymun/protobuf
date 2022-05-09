# frozen_string_literal: true

require "./config/env"

dev = ENV["RACK_ENV"] == "development"

if dev
  require "logger"
  logger = Logger.new($stdout)
end

require "rack/unreloader"
Unreloader = Rack::Unreloader.new(logger: logger,
                                  reload: dev) { EmployeeDetailsApp }

Unreloader.require("config/app.rb") { "EmployeeDetailsApp" }
run(dev ? Unreloader : EmployeeDetailsApp.freeze.app)
