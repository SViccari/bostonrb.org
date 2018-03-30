require "rails_helper"

describe MeetupService do
  let(:events_json) { JSON.parse(File.read("spec/fixtures/meetup_events_response.json")) }
  
  describe ".fetch_upcoming_event" do
    it "returns a single event" do
      expect(HTTParty).to receive(:get).and_return double('response', body: events_json)
      event = MeetupService.fetch_upcoming_event
      expect(event.name).to eq events_json.first["name"]
    end
  end
end