RSpec.describe Proto::OccupationsSet do # rubocop:disable Metrics/BlockLength
  context "when success" do
    it "return msg filled up object" do
      json = File.read("occupation3.json")
      input = JSON.parse(json, symbolize_names: true)
      described_class.call(input) do |m|
        m.success do |res|
        end
        m.failure { |error| raise "return to error block, unexpected result, #{error}" }
      end
    end
  end
end
