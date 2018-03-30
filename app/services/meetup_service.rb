class MeetupService
  class << self
    GROUP_NAME = "bostonrb"
    
    def fetch_upcoming_event
      url = "#{base_url}/events"
      response = HTTParty.get(url, page: 1)
      MeetupEvent.new(JSON.parse(response.body).first)
    rescue
      nil
    end
    
    private
    
    def base_url
      "https://api.meetup.com/#{GROUP_NAME}"
    end
  end
end