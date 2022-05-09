#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("..", __dir__))

require "sneakers"
require "sneakers/runner"
require "strum/service"
require "strum/pipe"
require "strum/json"
require "strum/esb"

unless defined?(Unreloader)
  require "rack/unreloader"
  Unreloader = Rack::Unreloader.new(reload: false)
end

Unreloader.require("handlers")
Unreloader.require("queues")

r = Sneakers::Runner.new([Queues::ProtoBuff])
r.run
