# frozen_string_literal: true

module Proto
  class OccupationsSet
    include Strum::Service

    def call # rubocop:disable Metrics/AbcSize
      list = []
      input.each do |occupation|
        list << Occupation::Occupation.new(occupation)
      end
      output(list_msg = Occupation::Occupations.new(occupations: list))
      Strum::Esb::Event.success(list_msg.to_proto, :proto, :send, content_type: "application/x-protobuf")
    end
  end
end
