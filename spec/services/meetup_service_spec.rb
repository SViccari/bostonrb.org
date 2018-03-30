require "rails_helper"

describe MeetupService do
  let(:events_response) { File.read("spec/fixtures/meetup_events_response.json") }
  
  describe ".fetch_upcoming_event" do
    it "returns a single event" do
      expect(HTTParty).to receive(:get).and_return double('response', body: events_response)
      event = MeetupService.fetch_upcoming_event
      expect(event.name).to eq JSON.parse(events_response).first["name"]
    end
  end
end