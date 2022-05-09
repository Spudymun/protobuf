# frozen_string_literal: true

require "logger"

threads 4, 16
workers ENV.fetch("PUMA_WORKERS", 0)

preload_app!
