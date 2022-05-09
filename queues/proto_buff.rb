# frozen_string_literal: true

require "strum/esb"
require "proto/occupations/occupations2_services_pb"

module Queues
  # Notice queue
  class ProtoBuff
    include Strum::Esb::Handler

    json false
    protobuf_service Occupation::Router::Service
    from_queue "proto",
               bindings: { event: %w[proto/send proto/sendd] }

    def event_proto_send(payload) # rubocop:disable Metrics/AbcSize
    end

    def event_proto_sendd(payload) # rubocop:disable Metrics/AbcSize
    end
  end
end
