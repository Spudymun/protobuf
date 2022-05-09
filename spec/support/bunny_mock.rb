# frozen_string_literal: true

require "bunny-mock"

RSpec.configure do |config|
  config.before(:each) do
    Strum::Esb.config.rabbit_channel_pool = begin
      ConnectionPool.new(size: 5, timeout: 5) do
        rabbit_connection = BunnyMock.new
        rabbit_connection.start
        rabbit_connection.create_channel
      end
    end
  end
end
