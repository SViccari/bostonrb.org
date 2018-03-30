require "rails_helper"

describe MeetupEvent do
  let(:event_json) { JSON.parse(File.read("spec/fixtures/meetup_events_response.json")).first }
  
  describe "#name" do
    it "maps from the JSON name field" do
      json = build_event_json(name: "A Meetup")
      expect(described_class.new(json).name).to eq "A Meetup"
    end
  end
  
  describe "#starts_at" do
    it "maps from the JSON time field" do
      expected_starts_at = 20.minutes.from_now.to_time
      json = build_event_json(time: expected_starts_at.to_i * 1000)
      expect(described_class.new(json).starts_at).to be_within(1.second).of(expected_starts_at)
    end
  end
  
  describe "#ends_at" do
    it "calculates from the JSON based on the duration" do
      expected_starts_at = 20.minutes.from_now.to_time
      json = build_event_json(time: expected_starts_at.to_i * 1000, duration: 60*60*1000)
      expect(described_class.new(json).ends_at.utc).to be_within(1.second).of(expected_starts_at + 1.hour)
    end
  end
  
  describe "#venue_name" do
    it "maps from the JSON field" do
      json = build_event_json(venue: { "name" => "A Venue" })
      expect(described_class.new(json).venue_name).to eq "A Venue"
    end
  end
  
  describe "#address_1" do
    it "maps from the JSON field" do
      json = build_event_json(venue: { "address_1" => "Address" })
      expect(described_class.new(json).address_1).to eq "Address"
    end
  end
  
  describe "#city" do
    it "maps from the JSON field" do
      json = build_event_json(venue: { "city" => "City" })
      expect(described_class.new(json).city).to eq "City"
    end
  end
  
  describe "#state" do
    it "maps from the JSON field" do
      json = build_event_json(venue: { "state" => "State" })
      expect(described_class.new(json).state).to eq "State"
    end
  end
  
  private
  
  def build_event_json(attrs)
    event_json.merge(attrs.stringify_keys)
  end
end